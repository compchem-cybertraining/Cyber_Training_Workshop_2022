from __future__ import division
from qm.model.model import Model
import numpy as np

class Tully(Model):
    """ Class for simple avoided crossing (SAC) model BO calculation

        :param object molecule: molecule object
        :param double A: parameter for simple avoided crossing model
        :param double B: parameter for simple avoided crossing model
        :param double C: parameter for simple avoided crossing model
        :param double D: parameter for simple avoided crossing model
    """
    def __init__(self, molecule, A=0.01, B=1.6, C=0.005, D=1.):
        # Initialize model common variables
        super(Tully, self).__init__(None)

        # Define parameters
        self.A = A
        self.B = B
        self.C = C
        self.D = D

        # Set 'l_nacme' with respect to the computational method
        # SAC model can produce NACs, so we do not need to get NACME
        molecule.l_nacme = False

        # SAC model can compute the gradient of several states simultaneously
        self.re_calc = False

    def get_data(self, molecule, base_dir, bo_list, dt, istep, calc_force_only):
        """ Extract energy, gradient and nonadiabatic couplings from simple avoided crossing model BO calculation

            :param object molecule: molecule object
            :param string base_dir: base directory
            :param integer,list bo_list: list of BO states for BO calculation
            :param double dt: time interval
            :param integer istep: current MD step
            :param boolean calc_force_only: logical to decide whether calculate force only
        """
        # Initialize diabatic Hamiltonian
        H = np.zeros((2, 2))
        dH = np.zeros((2, 2))
        U = np.zeros((2, 2))

        x = molecule.pos[0]

        # Define Hamiltonian
        if x>0:
         H[0][0] = self.A * (1.0 - np.exp(-self.B * x))
        else:
         H[0][0] = -self.A * (1.0 - np.exp(self.B * x))
        H[1][1] = - H[0][0]
        H[0][1] = self.C * np.exp(-self.D * x ** 2.0)
        H[1][0] = H[0][1]
        # Define a derivative of Hamiltonian
        if x>0:
         dH[0][0] = -self.B * self.A * np.exp(-self.B * x)
        else:
         dH[0][0] = self.B * -self.A * np.exp(self.B * x)
        dH[1][1]=-dH[0][0]
        dH[0][1]=-2.0 * self.D * self.C * x * np.exp(-self.D * x ** 2.0)
        dH[1][0]=dH[0][1]
        # Diagonalization
        E, U = np.linalg.eig(H)
        idx = np.argsort(E)
        E = E[idx]
        U = U[:, idx]
        # Extract adiabatic quantities
        molecule.states[0].energy = E[0]
        molecule.states[1].energy = E[1]

        molecule.states[0].force = np.dot(U[:, 0].conjugate().transpose(), np.dot(dH, U[:, 0]))
        molecule.states[1].force = np.dot(U[:, 1].conjugate().transpose(), np.dot(dH, U[:, 1]))

        molecule.nac[0, 1, 0, 0] = np.dot(U[:, 0].conjugate().transpose(), np.dot(dH, U[:, 1]))/ (E[1] - E[0])
        molecule.nac[1, 0, 0, 0] = np.copy(molecule.nac[0, 1, 0, 0])
