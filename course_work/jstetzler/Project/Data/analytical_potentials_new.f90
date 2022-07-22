!------------------------------------------------------------------------------!
! G-CTMQC code version 1.0                                                     !
!------------------------------------------------------------------------------!
!                                                                              !
! AUTHOR: Federica Agostini, Institut de Chimie Physique, Paris-Saclay.        !
!                                                                              !
! MODULE: analytical_potentials                                                !
! Free software: you can redistribute it and/or modify it under the terms of   !
!                the GNU Lesser General Public License as published by the     !
!                Free Software Foundation, either version 3 of the License, or !
!                (at your choice) any later version.                           !
!                                                                              !
! DESCRIPTION: Low dimensional model potentials in the diabatic basis          !
! where linear algebra tools are used for the diagonalization of the           !
! Hamiltonian.                                                                 !
!                                                                              !
! REVISION HISTORY: 11/03/2021 - Initial Version                               !
!                                                                              !
!------------------------------------------------------------------------------!
!> @author
!> Federica Agostini, Institut de Chimie Physique, University Paris-Saclay.
!> @brief Diabatic low dimensional potentials.
MODULE analytical_potentials

  USE kinds
  USE variables
  USE atomic_masses

  IMPLICIT NONE

  CONTAINS

  !---------------------------------------------------------------------------!
  ! DESCRIPTION: Definition of electronic structure properties                !
  !---------------------------------------------------------------------------!
  !> Definition of electronic structure properties, ie, energies, gradients and
  !! derivative couplings on model potentials integrated in the G-CTMQC.
  !> @param[inout] Hel electronic Hamiltonian at the trajectory position
  !> @param[inout] grad_BO gradient of the adiabatic energy at the trajectory position
  !> @param[inout] NAC non-adiabatic coupling vector at the trajectory position
  !> @param[in] Q trajectory position
  !> @param Ebo adiabatic energy at the trajectory position
  !> @param grad_Hel gradient of the electronic Hamiltonian at the trajectory position
  !> @param U transformation matrix from the diabatic to the adiabatic basis
  !> @param factor control factor for the phase relation between adjacent adiabatic states
  !> @param delta spatial increment to compute numerical derivatives
  !> @param i_dof index running on the n_dof degrees of freedom
  !> @param ix, i integer indices
  !> @return The values of the adiabatic energies are returned as the diagonal
  !! elements of Hel; the gradient of the adiabatic energies and the non-adiabatic
  !! couplings are returned in grad_BO and NAC.
  SUBROUTINE new_model_potentials(Hel,grad_BO,NAC,Q)

    REAL(KIND=dp),  INTENT(IN)    :: Q(n_dof)
    REAL(KIND=dp),  INTENT(INOUT) :: Hel(nstates,nstates),            &
                                     grad_BO(nstates,nstates,n_dof),  &
                                     NAC(nstates,nstates,n_dof)
    REAL(KIND=dp),  ALLOCATABLE   :: Ebo(:,:),grad_Hel(:,:,:),U(:,:,:),factor(:)
    REAL(KIND=dp)                 :: delta=0.01_dp
    INTEGER                       :: i_dof,ix,i

    ALLOCATE(Ebo(nstates,-1:1),U(nstates,nstates,-1:1), &
             grad_Hel(nstates,nstates,n_dof),           &
             factor(nstates))
    Ebo       = 0.0_dp
    U         = 0.0_dp
    grad_Hel  = 0.0_dp
    factor    = 1.0_dp

    IF(model_potential=="NaI")                       &
       CALL NaI_potential(Hel,Q(1),grad_Hel(:,:,1))
    IF(model_potential=="IBr")                       &
       CALL IBr_potential(Hel,Q(1),grad_Hel(:,:,1))
    IF(model_potential=="double-well")               &
       CALL doublewell_potential(Hel,Q(1),grad_Hel(:,:,1))
    IF(model_potential=="SubotnikJPCA2019")          &
       CALL SubotnikJPCA2019(Hel,Q(1),grad_Hel(:,:,1))
    IF(model_potential=="CO")                       &
       CALL CO_potential(Hel,Q(1),grad_Hel(:,:,1))

    grad_BO=0.0_dp
    DO i_dof=1,n_dof
      DO ix=-1,1,1
        CALL diagonalize(Hel+grad_Hel(:,:,i_dof)*DBLE(ix)*delta,Ebo(:,ix),U(:,:,ix))
        IF(ix==0) THEN
          CALL check_overlap(U(:,:,ix),U(:,:,ix-1),factor)
          DO i=1,nstates
            U(:,i,ix)=factor(i)*U(:,i,ix)
          ENDDO
          CALL non_adiabatic_couplings(Ebo(:,ix),grad_Hel,U(:,:,ix),NAC)
        ENDIF
      ENDDO
      !DO i=1,nstates
      !  grad_BO(i,i,i_dof)=(Ebo(i,1)-Ebo(i,-1))/2._dp/delta
      !ENDDO
    ENDDO

    IF(.NOT.spin_dia) THEN
      grad_BO = 0.0_dp
      Hel=0.0D0
      DO i=1,nstates
        Hel(i,i)=Ebo(i,0)
        grad_BO(i,i,:)=(Ebo(i,1)-Ebo(i,-1))/2._dp/delta
      ENDDO
    ENDIF

    IF(spin_dia) THEN
      NAC = 0.0_dp
      DO i=1,nstates
        grad_BO(i,i,:)=grad_Hel(i,i,:)
      ENDDO
    ENDIF

    DEALLOCATE(Ebo,grad_Hel,U,factor)
 
  END SUBROUTINE new_model_potentials

  !---------------------------------------------------------------------------!
  ! DESCRIPTION: adjacent adiabatic states are continuous in nuclear space    !
  !---------------------------------------------------------------------------!
  !> Check that adjacent adiabatic states are continuous in nuclear space.
  !> @param[in] eigenv1, eigenv2 eigenstates of the electronic Hamiltonian at
  !! adjecent points in nuclear space
  !> @param[inout] factor control factor for the phase relation between
  !!adjacent adiabatic states
  !> @param sum scalar product between eigenv1 and eigenv2
  !> @param i, j integer indices
  !> @return The values of factor is returned: it is 1 if the two vectors are
  !! in phase or -1 if the two vectors are out of phase.
  SUBROUTINE check_overlap(eigenv1,eigenv2,factor)

    REAL(KIND=dp),INTENT(IN)    :: eigenv1(nstates,nstates), &
                                   eigenv2(nstates,nstates)
    REAL(KInd=dp),INTENT(INOUT) :: factor(nstates)
    REAL(KInd=dp)               :: sum
    INTEGER                     :: i,j

    DO i=1,nstates
      sum=0.0_dp
      DO j=1,nstates
        sum=sum+eigenv1(j,i)*eigenv2(j,i)
      ENDDO
      IF(sum<0.0_dp) factor(i)=-1._dp
    ENDDO

  END SUBROUTINE check_overlap

  !---------------------------------------------------------------------------!
  ! DESCRIPTION: Diagonalization of a real symmetric matrix                   !
  !---------------------------------------------------------------------------!
  !> Diagonalization of a real symmetric matrix with the Lapac procedure dsyevd
  !> @param[in] matrix to be diagonalized
  !> @param[inout] eigenvalues of the matrix
  !> @param[inout] eigenvectors of the matrix
  !> @param ioerr control variable for diagonalization errors
  !> @param lwork dimension of the array work
  !> @param dim_work temporary dimension of the array work
  !> @param liwork dimension of the array iwork
  !> @param dim_iwork temporary dimension of the array iwork
  !> @param iwork integer array
  !> @param work double precision array
  !> @return The eigenvalues and eigenvectors of the matrix are returned.
  SUBROUTINE diagonalize(matrix,eigenvalues,eigenvectors)

    REAL(KIND=dp),    INTENT(IN)    :: matrix(nstates,nstates)
    REAL(KIND=dp),    INTENT(INOUT) :: eigenvalues(nstates),   &
                                       eigenvectors(:,:)
    INTEGER                         :: ioerr,lwork,dim_work,   &
                                       liwork,dim_iwork
    INTEGER,          ALLOCATABLE   :: iwork(:)
    REAL(KIND=dp),    ALLOCATABLE   :: work(:)

    eigenvectors=matrix

    dim_work=1
    dim_iwork=1
    ALLOCATE(work(dim_work),iwork(dim_iwork))
    lwork=-1
    liwork=-1

    CALL dsyevd('V','U',nstates,eigenvectors,nstates,      &
                eigenvalues,work,lwork,iwork,liwork,ioerr)
    IF(ioerr/=0) PRINT*,'error diagonalizing 1'

    dim_work=int(work(1))
    dim_iwork=iwork(1)

    DEALLOCATE(work,iwork)
    ALLOCATE(work(dim_work),iwork(dim_iwork))

    eigenvectors=matrix
    lwork=1+6*nstates+2*nstates**2
    liwork=3+5*nstates

    CALL dsyevd('V','U',nstates,eigenvectors,nstates,      &
                eigenvalues,work,lwork,iwork,liwork,ioerr)
    IF(ioerr/=0) PRINT*,'error diagonalizing 2'

    DEALLOCATE(work,iwork)

  END SUBROUTINE diagonalize

  !---------------------------------------------------------------------------!
  ! DESCRIPTION: Calculation of analytical non-adiabatic couplings            !
  !---------------------------------------------------------------------------!
  !> Calculation of analytical non-adiabatic couplings.
  !> @param[in] energy of the adiabatic states
  !> @param[in] gradients of the adiabatic energies
  !> @param[in] eigenvectors of the electronic Hamiltonian
  !> @param[inout] couplings matrix representing the non-adiabatic couplings
  !> @param i,j,k,l integer indices
  !> @return The matrix of non-adiabatic couplings is returned.
  SUBROUTINE non_adiabatic_couplings(energy,gradients,eigenvectors,couplings)

    REAL(KIND=dp),   INTENT(IN)    :: energy(nstates),                  &
                                      gradients(nstates,nstates,n_dof), &
                                      eigenvectors(nstates,nstates)
    REAL(KIND=dp),   INTENT(INOUT) :: couplings(nstates,nstates,n_dof)
    INTEGER                        :: i,j,k,l

   couplings=0.0_dp

    DO i=1,nstates
      DO j=1,nstates
         DO k=1,nstates
           DO l=1,nstates
             couplings(i,j,:)=couplings(i,j,:)+           &
                      eigenvectors(k,i)*gradients(k,l,:)* &
                      eigenvectors(l,j)
           ENDDO
         ENDDO
         IF(i/=j) couplings(i,j,:)=couplings(i,j,:)/(energy(j)-energy(i))
      ENDDO
    ENDDO

  END SUBROUTINE non_adiabatic_couplings

  !---------------------------------------------------------------------------!
  ! DESCRIPTION: Analytical model potentials for the diatomic molecule NaI    !
  !---------------------------------------------------------------------------!
  !> Definition of the analytical model potentials for the diatomic molecule NaI
  !! following the work of Faist and Levine published in JCP (1976)
  !! DOI:10.1063/1.432555.
  !> @param[inout] H electronic Hamiltonian in the diabatic basis
  !> @param[inout] grad_H gradient of the electronic Hamiltonian in the
  !! diabatic basis
  !> @param[in] R nuclear position
  !> @param Acov,Bcov,rhocov,Ccov,Aion,Bion,rhoion,Cion,alphaMp,alphaXm,Eth,A,rho
  !! parameters of the potentials: Note that the used units are electronvolts and
  !! and angstroms in the original definition
  !> @return The electronic Hamiltonian and its nuclear gradients are returned.
  SUBROUTINE NaI_potential(H,R,grad_H,R_crossing)

    REAL(KIND=dp), INTENT(INOUT)           :: H(nstates,nstates),      &
                                              grad_H(nstates,nstates)
    REAL(KIND=dp), INTENT(INOUT), OPTIONAL :: R_crossing
    REAL(KIND=dp), INTENT(IN)              :: R
    REAL(KIND=dp)                          :: Acov,Bcov,rhocov,Ccov, &
                                              Aion,Bion,rhoion,Cion, &
                                              alphaMp,alphaXm,Eth,   &
                                              A,rho

    Acov    = 3150._dp  !eV
    Bcov    = 2.647_dp  !eV^1/12 * A
    rhocov  = 0.435_dp  !A
    Ccov    = 1000._dp  !eV * A^6
    Aion    = 2760._dp  !eV
    Bion    = 2.398_dp  !eV^1/8 * A
    rhoion  = 0.3489_dp !A
    Cion    = 11.3_dp   !eV * A^6
    Eth     = 2.075_dp  !eV
    alphaMp = 0.408_dp  !A^3
    alphaXm = 6.431_dp  !A^3
    A       = 17.08_dp  !eV
    rho     = 1.239_dp  !A
 
    Acov    = Acov/au_to_eV
    !Bcov    =
    rhocov  = rhocov/au_to_Ang
    !Ccov    =
    Aion    = Aion/au_to_eV
    !Bion    =
    rhoion  = rhoion/au_to_Ang
    !Cion    =
    Eth     = Eth/au_to_eV
    alphaMp = alphaMp/au_to_Ang**3
    alphaXm = alphaXm/au_to_Ang**3
    A       = A/au_to_eV
    rho     = rho/au_to_Ang

    H(1,1)=(Acov+(1._dp/au_to_eV)*(Bcov/(R*au_to_Ang))**12)*EXP(-R/rhocov) &
           -(1._dp/au_to_eV)*Ccov/(R*au_to_Ang)**6
    H(1,2)=A*EXP(-R/rho)
    H(2,1)=A*EXP(-R/rho)
    H(2,2)=(Aion+(1._dp/au_to_eV)*(Bion/(R*au_to_Ang))**8)*EXP(-R/rhoion)  &
           -1.0_dp/R-(alphaMp+alphaXm)/2._dp/R**4                          &
           -(1._dp/au_to_eV)*Cion/(R*au_to_Ang)**6                         &
           -2._dp*alphaMp*alphaXm/R**7+Eth
 
    grad_H(1,1)=(-12._dp/R**13)*(1._dp/au_to_eV)*(Bcov/au_to_Ang)**12*EXP(-R/rhocov)          &
                -(1._dp/rhocov)*(Acov+(1._dp/au_to_eV)*(Bcov/(R*au_to_Ang))**12)*EXP(-R/rhocov) &
                -(-6._dp/R**7)*(1._dp/au_to_eV)*Ccov/au_to_Ang**6
    grad_H(1,2)=-A/rho*EXP(-R/rho)
    grad_H(2,1)=-A/rho*EXP(-R/rho)
    grad_H(2,2)=(-8._dp/R**9)*(1._dp/au_to_eV)*(Bion/au_to_Ang)**8*EXP(-R/rhoion)            &
                -(1._dp/rhoion)*(Aion+(1._dp/au_to_eV)*(Bion/(R*au_to_Ang))**8)*EXP(-R/rhoion)  &
                +1.0_dp/R**2-(-4._dp/R**5)*(alphaMp+alphaXm)/2._dp                              &
                -(-6._dp/R**7)*(1._dp/au_to_eV)*Cion/au_to_Ang**6                               &
                -(-7._dp/R**8)*2._dp*alphaMp*alphaXm

    mass(1)=amu_to_au*(M_Na*M_I)/(M_Na+M_I)

    IF(PRESENT(R_crossing)) R_crossing=7.0_dp
 
  END SUBROUTINE NaI_potential


  !---------------------------------------------------------------------------!
  ! DESCRIPTION: Analytical model potentials for the diatomic molecule CO    !
  !---------------------------------------------------------------------------!
  !> Definition of the analytical model potentials for the diatomic molecule CO
  !! from electronic structure calculations in OpenMOLCAS with ANO-R3 basis set
  !  and (10,11) active space at CAS-PT2 level
  !> @param[inout] H electronic Hamiltonian in the adiabatic basis
  !> @param[inout] grad_H gradient of the electronic Hamiltonian in the
  !! adiabatic basis
  !> @param[in] R nuclear position in atomic units
  !> @param
  !a1,b1,c1,d1,a2,b2,c2,d2
  !! parameters of the potentials: In atomic units 
  !> @return The electronic Hamiltonian and its nuclear gradients are returned.
  SUBROUTINE CO_potential(H,R,grad_H,R_crossing)

    REAL(KIND=dp), INTENT(INOUT)           :: H(nstates,nstates),      &
                                              grad_H(nstates,nstates)
    REAL(KIND=dp), INTENT(INOUT), OPTIONAL :: R_crossing
    REAL(KIND=dp), INTENT(IN)              :: R
    REAL(KIND=dp)                          :: a1,b1,c1,d1, &
                                              a2,b2,c2,d2!, &
                                              A,R0,alph
                                              

    A       = 0.1799280851288175_dp
    R0      = 1.697003219844691_dp
    alph    = 0.6125184916942731_dp
    a1      = 0.2813691253833273_dp
    b1      = 1.265797273927884_dp  
    c1      = 2.871581486895835_dp     
    d1      = 113.0891872969292_dp  
    a2      = 0.1997609462293626_dp  
    b2      = -1.571565351612458_dp  
    c2      = 3.336735619601595_dp 
    d2      = 113.0391859176413_dp   
    
    !Acov    = Acov/au_to_eV
    !Bcov    =
    !rhocov  = rhocov/au_to_Ang
    !Ccov    =
    !Aion    = Aion/au_to_eV
    !Bion    =
    !rhoion  = rhoion/au_to_Ang
    !Cion    =
    !Eth     = Eth/au_to_eV
    !alphaMp = alphaMp/au_to_Ang**3
    !alphaXm = alphaXm/au_to_Ang**3
    !A       = A/au_to_eV
    !rho     = rho/au_to_Ang

    H(1,1)= a1*(1.0D0-exp(-b1*R+c1))**2-d1
    H(2,1)= A*exp(-alph*(R-R0)**2)
    H(1,2)= A*exp(-alph*(R-R0)**2)
    H(2,2)= a2*(1.0D0-exp(-b2*R+c2))**2-d2

    grad_H(1,1)= 2.0D0*a1*(1 - exp(-b1*(R - c1)))*b1*exp(-b1*(R - c1))
    grad_H(1,2)= -2.0D0*A*alph*(R - R0)*exp(-alph*(R - R0)**2)
    grad_H(2,1)= -2.0D0*A*alph*(R - R0)*exp(-alph*(R - R0)**2)
    grad_H(2,2)= 2.0D0*a2*(1 - exp(-b2*(R - c2)))*b2*exp(-b2*(R - c2))

    mass(1)=amu_to_au*(M_C*M_O)/(M_C+M_O)

    IF(PRESENT(R_crossing)) R_crossing= 4.96676717_dp

  END SUBROUTINE CO_potential

  !---------------------------------------------------------------------------!
  ! DESCRIPTION: Analytical model potentials for the diatomic molecule IBr    !
  !---------------------------------------------------------------------------!
  !> Definition of the analytical model potentials for the diatomic molecule NaI
  !! following the work of Guo published in JCP (1993)
  !! DOI:10.1063/1.465285.
  !> @param[inout] H electronic Hamiltonian in the diabatic basis
  !> @param[inout] grad_H gradient of the electronic Hamiltonian in the
  !! diabatic basis
  !> @param[in] R nuclear position
  !> @param A0,alpha0,r0,A1,alpha1,r1,D,A2,alpha2,B2,beta2,h12
  !! parameters of the potentials: Note that the used units are atomic units
  !> @return The electronic Hamiltonian and its nuclear gradients are returned.
  SUBROUTINE IBr_potential(H,R,grad_H,R_crossing)

    REAL(KIND=dp), INTENT(INOUT)           :: H(nstates,nstates),        &
                                              grad_H(nstates,nstates)
    REAL(KIND=dp), INTENT(INOUT), OPTIONAL :: R_crossing
    REAL(KIND=dp), INTENT(IN)              :: R
    REAL(KIND=dp)                          :: A0,alpha0,r0,A1,alpha1,r1, &
                                              D,A2,alpha2,B2,beta2,h12

    A0     = 0.0670_dp
    alpha0 = 0.9960_dp
    r0     = 4.66660_dp
    A1     = 0.010190_dp
    alpha1 = 1.2710_dp
    r1     = 5.34790_dp
    D      = 0.016790_dp
    A2     = 2.8260_dp
    alpha2 = 0.91860_dp
    B2     = 30000000.0_dp
    beta2  = 4.0_dp
    h12    = 0.00068340_dp

    H      = 0.0_dp
    H(1,1) = A0*((1.0_dp-EXP(-alpha0*(R-r0)))**2-1.0_dp)
    H(2,2) = A1*((1.0_dp-EXP(-alpha1*(R-r1)))**2-1.0_dp)+D
    H(3,3) = A2*EXP(-alpha2*R)+B2*EXP(-beta2*R)
    H(2,3) = h12
    H(3,2) = h12

    grad_H      = 0.0_dp
    grad_H(1,1) = A0*2._dp*(1.0_dp-EXP(-alpha0*(R-r0)))*(alpha0*EXP(-alpha0*(R-r0)))
    grad_H(2,2) = A1*2._dp*(1.0_dp-EXP(-alpha1*(R-r1)))*(alpha1*EXP(-alpha1*(R-r1)))
    grad_H(3,3) = -alpha2*A2*EXP(-alpha2*R)-beta2*B2*EXP(-beta2*R)

    mass(1)=amu_to_au*(M_Br*M_I)/(M_Br+M_I)

    IF(PRESENT(R_crossing)) R_crossing=6.20_dp

  END SUBROUTINE IBr_potential

  !---------------------------------------------------------------------------!
  ! DESCRIPTION: Analytical model potentials for a double well                !
  !---------------------------------------------------------------------------!
  !> Definition of the analytical model potentials a double well
  !> @param[inout] H electronic Hamiltonian in the diabatic basis
  !> @param[inout] grad_H gradient of the electronic Hamiltonian in the
  !! diabatic basis
  !> @param[in] R nuclear position
  !> @param KX,DELTA,X1,X2,X3,GAMMA,ALPHA
  !! parameters of the potentials: Note that the used units are atomic units
  !> @return The electronic Hamiltonian and its nuclear gradients are returned.
  SUBROUTINE doublewell_potential(H,R,grad_H,R_crossing)

    REAL(KIND=dp), INTENT(INOUT)           :: H(nstates,nstates),      &
                                              grad_H(nstates,nstates)
    REAL(KIND=dp), INTENT(INOUT), OPTIONAL :: R_crossing
    REAL(KIND=dp), INTENT(IN)              :: R
    REAL(KIND=dp)                          :: KX,DELTA,X1,X2,X3,       &
                                              GAMMA,ALPHA

    KX     = 0.020_dp
    DELTA  = 0.010_dp  !0.0_dp
    X1     = 6.0_dp
    X2     = 2.0_dp
    X3     = 3.8750_dp
    GAMMA  = 0.01_dp  !0.005_dp
    ALPHA  = 3.0_dp

    H(1,1)=0.5d0*KX*(R-X1)**2
    H(2,2)=0.5d0*KX*(R-X2)**2 +DELTA
    H(1,2)=GAMMA*dexp(-ALPHA*(R-X3)**2)
    H(2,1)=H(1,2)

    grad_H(1,1)=KX*(R-X1)
    grad_H(2,2)=KX*(R-X2)
    grad_H(1,2)=GAMMA*(-2._dp*ALPHA*(R-X3))*dexp(-ALPHA*(R-X3)**2)
    grad_H(2,1)=grad_H(1,2)

    IF(PRESENT(R_crossing)) R_crossing=X3

  END SUBROUTINE doublewell_potential

  !---------------------------------------------------------------------------!
  ! DESCRIPTION: Analytical model potentials for parallel constant surfaces   !
  !---------------------------------------------------------------------------!
  !> Definition of the analytical model potentials for parallel constant PESs
  !> @param[inout] H electronic Hamiltonian in the diabatic basis
  !> @param[inout] grad_H gradient of the electronic Hamiltonian in the
  !! diabatic basis
  !> @param[in] R nuclear position
  !> @param A,B
  !! parameters of the potentials: Note that the used units are atomic units
  !> @return The electronic Hamiltonian and its nuclear gradients are returned.
  SUBROUTINE SubotnikJPCA2019(H,R,grad_H)

    REAL(KIND=dp), INTENT(INOUT)           :: H(nstates,nstates),      &
                                              grad_H(nstates,nstates)
    REAL(KIND=dp), INTENT(IN)              :: R
    REAL(KIND=dp)                          :: A,B

    A = 0.10_dp
    B = 3.0_dp

    H(1,1)=-A*cos(0.5_dp*PI*(ERF(B*R)+1.0_dp))
    H(2,2)=-H(1,1)!A*cos(0.5_dp*PI*(ERF(B*R)+1.0_dp))
    H(1,2)=A*sin(0.5_dp*PI*(ERF(B*R)+1.0_dp))
    H(2,1)=H(1,2)

    grad_H(1,1)=SQRT(PI)*A*B*sin(0.5_dp*PI*(ERF(B*R)+1.0_dp))*EXP(-(B*R)**2)
    grad_H(2,2)=-grad_H(1,1)!-SQRT(PI)*A*B*sin(0.5_dp*PI*(ERF(B*R)+1.0_dp))*EXP(-(B*R)**2)
    grad_H(1,2)=SQRT(PI)*A*B*cos(0.5_dp*PI*(ERF(B*R)+1.0_dp))*EXP(-(B*R)**2)
    grad_H(2,1)=grad_H(1,2)

  END SUBROUTINE SubotnikJPCA2019

  !---------------------------------------------------------------------------!
  ! DESCRIPTION: Plot the adiabatic and diabatic analytical potentials        !
  !---------------------------------------------------------------------------!
  !> Plot the adiabatic and diabatic analytical potentials.
  !> @param Rmin,Rmax limits of the domain to plot the potentials
  !> @param V values of the diabatic potentials
  !> @param epsBO values of the adiabatic potentials
  !> @param nacv values of the non-adiabatic couplings
  !> @param grad_V values of the gradients of the diabatic potentials
  !> @param U transformation matrix from the diabatic to the adiabatic basis
  !! at the current position
  !> @param save_U transformation matrix from the diabatic to the
  !! adiabatic basis at the previous position
  !> @param factor control factor for the phase relation between adjacent
  !! adiabatic states
  !> @param npoints number of grid points in nuclear space to plot the potentials
  !> @param delta spatial increment to compute numerical derivatives
  !> @param R
  !> @param ground_states_density initial nuclear density consistent with the
  !! distribution of classical initial positions and momenta
  !> @param ios control variable for output errors
  !> @param ix,i integer indices
  SUBROUTINE plot_potential()

    REAL(KIND=dp), ALLOCATABLE     :: Rmin(:),Rmax(:),   &
                                      V(:,:),epsBO(:),   &
                                      nacv(:,:,:),       &
                                      grad_V(:,:,:),     &
                                      U(:,:),save_U(:,:),&
                                      factor(:)
    INTEGER,       ALLOCATABLE     :: npoints(:)
    REAL(KIND=dp)                  :: delta,R,ground_state_density
    INTEGER                        :: ios,ix,i
    
    ALLOCATE(Rmin(n_dof),Rmax(n_dof),npoints(n_dof), &
             V(nstates,nstates),epsBO(nstates),      &
             nacv(nstates,nstates,n_dof),            &
             grad_V(nstates,nstates,n_dof),          &
             U(nstates,nstates),factor(nstates),     &
             save_U(nstates,nstates))

    factor=1._dp

    OPEN(234,FILE="analytical_potential.dat", &
         STATUS="replace",FORM="formatted",   &
         ACTION="write",IOSTAT=ios)
    IF(ios/=0) PRINT*,'error opening analytical potential file'

    IF(model_potential=="NaI") THEN
      WRITE(234,*) "#Postion, V11, V12, V22, BO1, BO2, NACV12, NACV21,", &
                   "NACV11, NACV22"
      Rmin(1)     = 1.0_dp/au_to_Ang
      Rmax(1)     = 16.0_dp/au_to_Ang
      delta       = 0.001_dp/au_to_Ang
      npoints(1)  =  INT((Rmax(1)-Rmin(1))/DBLE(delta))+1
      DO ix=1,npoints(1)
        R=Rmin(1)+delta*(ix-1)
        CALL NaI_potential(V,R,grad_V)
        CALL diagonalize(V,epsBO,U)
        IF(ix>1) CALL check_overlap(U,save_U,factor)
        DO i=1,nstates
          U(:,i)=factor(i)*U(:,i)
        ENDDO
        CALL non_adiabatic_couplings(epsBO,grad_V,U,nacv)
        ground_state_density=SQRT(mass(1)*0.00134881_dp/PI)*               &
                             EXP(-mass(1)*0.00134881_dp*(R-R0(1))**2)
        WRITE(234,'(100f14.8)') R,V(1,1),V(1,2),V(2,2),   &
                                epsBO,nacv(1,2,1),        &
                                nacv(2,1,1),nacv(1,1,1),  &
                                nacv(2,2,1),ground_state_density
        save_U=U
      ENDDO
    ENDIF

    IF(model_potential=="CO") THEN
      WRITE(234,*) "#Postion, V11, V12, V22, BO1, BO2, NACV12, NACV21,", &
                   "NACV11, NACV22"
      Rmin(1)     = 1.0_dp/au_to_Ang
      Rmax(1)     = 10.0_dp/au_to_Ang
      delta       = 0.001_dp/au_to_Ang
      npoints(1)  =  INT((Rmax(1)-Rmin(1))/DBLE(delta))+1
      DO ix=1,npoints(1)
        R=Rmin(1)+delta*(ix-1)
        CALL CO_potential(V,R,grad_V)
        CALL diagonalize(V,epsBO,U)
        CALL non_adiabatic_couplings(epsBO,grad_V,U,nacv)
        !ground_state_density=SQRT(mass(1)*sigma(1)/PI)*               &
                             !EXP(-mass(1)*sigma(1)*(R-R0(1))**2)
        WRITE(234,'(100f14.8)') R,V(1,1),V(1,2),V(2,2),   &
                                epsBO,nacv(1,2,1),        &
                                nacv(2,1,1),nacv(1,1,1),  &
                                nacv(2,2,1)!,ground_state_density
        
      ENDDO
    ENDIF

    IF(model_potential=="IBr") THEN
    WRITE(234,*) "#Postion, V11, V12, V22, BO1, BO2, NACV12, NACV21,", &
                 "NACV11, NACV22"
      Rmin(1)     = 3.0_dp
      Rmax(1)     = 20.0_dp
      delta       = 0.01_dp
      npoints(1)  =  INT((Rmax(1)-Rmin(1))/DBLE(delta))+1
      DO ix=1,npoints(1)
        R=Rmin(1)+delta*(ix-1)
        CALL IBr_potential(V,R,grad_V)
        CALL diagonalize(V,epsBO,U)
        CALL non_adiabatic_couplings(epsBO,grad_V,U,nacv)
        ground_state_density=SQRT(1._dp/PI/0.095610_dp**2)*               &
                       EXP(-(R-R0(1))**2/0.095610_dp**2)
        WRITE(234,'(100f14.8)') R,(V(1,i),i=1,nstates),    &
                                (V(2,i),i=1,nstates),      &
                                (V(3,i),i=1,nstates),      &
                                (epsBO(i),i=1,nstates),    &
                                (nacv(1,i,1),i=1,nstates), &
                                (nacv(2,i,1),i=1,nstates), &
                                (nacv(3,i,1),i=1,nstates), &
                                ground_state_density
      ENDDO
    ENDIF

    IF(model_potential=="double-well") THEN
      WRITE(234,*) "#Postion, V11, V12, V22, BO1, BO2, NACV12, NACV21,", &
                   "NACV11, NACV22"
      Rmin(1)     = -5.0_dp
      Rmax(1)     = 15.0_dp
      delta       = 0.01_dp
      npoints(1)  =  INT((Rmax(1)-Rmin(1))/DBLE(delta))+1
      DO ix=1,npoints(1)
        R=Rmin(1)+delta*(ix-1)
        CALL doublewell_potential(V,R,grad_V)
        CALL diagonalize(V,epsBO,U)
        CALL non_adiabatic_couplings(epsBO,grad_V,U,nacv)
        ground_state_density=SQRT(1.0_dp/PI/sigma(1)**2)*                 &
                             EXP(-(R-R0(1))**2/sigma(1)**2)
        WRITE(234,'(100f14.8)') R,V(1,1),V(1,2),V(2,2),   &
                                epsBO,nacv(1,2,1),        &
                                nacv(2,1,1),nacv(1,1,1),  &
                                nacv(2,2,1),ground_state_density
      ENDDO
    ENDIF

    IF(model_potential=="SubotnikJPCA2019") THEN
      WRITE(234,*) "#Postion, V11, V12, V22, BO1, BO2, NACV12, NACV21,", &
                   "NACV11, NACV22"
      Rmin(1)     = -5.0_dp
      Rmax(1)     = 5.0_dp
      delta       = 0.01_dp
      npoints(1)  =  INT((Rmax(1)-Rmin(1))/DBLE(delta))+1
      DO ix=1,npoints(1)
        R=Rmin(1)+delta*(ix-1)
        CALL SubotnikJPCA2019(V,R,grad_V)
        CALL diagonalize(V,epsBO,U)
        CALL non_adiabatic_couplings(epsBO,grad_V,U,nacv)
        !ground_state_density=SQRT(1.0_dp/PI/sigma(1)**2)*                 &
        !                    EXP(-(R-R0(1))**2/sigma(1)**2)
        WRITE(234,'(100f14.8)') R,V(1,1),V(1,2),V(2,2),            &
                                epsBO,grad_V(1,1,1),grad_V(1,2,1), &
                                grad_V(2,2,1),nacv(1,1,1),         &
                                nacv(1,2,1),nacv(2,1,1),           &
                                nacv(2,2,1)!,ground_state_density
      ENDDO
    ENDIF

    CLOSE(234)

    DEALLOCATE(Rmin,Rmax,npoints,V,epsBO,nacv,grad_V,U,save_U,factor)
 
  END SUBROUTINE plot_potential

END MODULE analytical_potentials


