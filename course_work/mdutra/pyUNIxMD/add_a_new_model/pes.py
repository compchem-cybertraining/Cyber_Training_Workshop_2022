from molecule import Molecule
import qm
from misc import data, amu_to_au

data["XX"] = 2000/amu_to_au

# Define the target system.
geom = """
1

XX     0.000000     0.000000
"""
mol = Molecule(geometry=geom, nstates=2, ndim=1, l_model=True)

for i, x in enumerate([x for x in range(100)]):
    mol.pos[0, 0] = -10 + 0.2*x

    # Set QM method.
    qm1 = qm.model.Tully(molecule=mol)
    qm1.get_data(mol, "", [], 0., -1, False)
    if (i > 0): mol.adjust_nac()
    
    mol.backup_bo()

    print(f"{mol.pos[0, 0]:13.8f} {mol.states[0].energy:13.8f} {mol.states[1].energy:13.8f}\
 {mol.states[0].force:13.8f} {mol.states[1].force:13.8f} {mol.nac[0, 1, 0, 0]:13.8f}")

