#!/usr/bin/env bash
# For Libra kernel: setup environment variables, etc.
# from: /projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs/libra/share/jupyter/kernels/libra-plus
#
# codes include:
# ---------------
# - columbus
# - cp2k
# - dftb+
# - dynemol
# - eQE
# - ergoSCF (serial and MPI)
# - LAMMPS
# - MOPAC
# - Newton-X
# - Q-Chem
# - Quantum Espresso 6.2.1
# - QXMD
#
# compilers include:
# ---------------
# MKL 2020.2
# INTEL 18.3
# openmpi 3.0.3/gcc 7.3.0


# compiler paths
# ---------------
# MKL 2020.2
#   Dynemol
#   eQE
export MKL=/util/academic/intel/20.2/compilers_and_libraries_2020.2.254/linux/mkl
export MKLROOT=/util/academic/intel/20.2/compilers_and_libraries_2020.2.254/linux/mkl
export MKL_TARGET_ARCH=intel64

# INTEL 18.3:
#   Dynemol
export INTEL=/util/academic/intel
export INTEL_LICENSE_FILE=/util/academic/intel/licenses/server.lic

# openmpi 3.0.3/gcc 7.3.0
#   eQE
export OMPI=/util/common/openmpi/3.0.3/gcc-7.3.0

# Java 1.8.0
#   openmpi
export JAVA_HOME=/util/academic/java/jdk1.8.0_152

export PYTHONPATH=/projects/academic/cyberwksp21/Software/Libra/_build/src:/util/academic/dftbplus/20.2.1-arpack-gcc-7.3.0/lib/python3.6/site-packages:$PYTHONPATH

# columbus
export COLUMBUS=/util/academic/columbus/7.0_2017-12-07-bin/Columbus

# newtonx
export NX=/util/academic/newton-x/NX-2.2-B09/bin

# eqe and QE
# is it ok to have two paths here? Maybe. QE is first...
#export PWSCF=/projects/academic/cyberwksp21/Software/qe/6.7:/projects/academic/cyberwksp21/Software/eqe/eqe-0.2.0
export PWSCF=/util/academic/qe/6.2.1-avx2

# lammps
export LAMMPS=/projects/academic/cyberwksp21/Software/lammps/lammps-29Oct20/src

# mopac
export MOPAC_LICENSE=/util/academic/mopac/MOPAC2016_for_CentOS-7

# qchem
export QC=/util/academic/qchem/qc50
export QCPLATFORM=LINUX_Ix86_64
export QCREMLICHOST=srv-p22-12.cbls.ccr.buffalo.edu
export QCSCRATCH=/panasas/scratch
export QCAUX=/util/academic/qchem/qc50/qcaux
export P4_RSHCOMMAND=/usr/bin/ssh
export QCRSH=/usr/bin/ssh

export LD_LIBRARY_PATH=/projects/academic/cyberwksp21/Software/Libra/_build/src:/util/academic/columbus/7.0_2017-12-07-bin/Columbus:/util/academic/mopac/MOPAC2016_for_CentOS-7:/util/academic/gcc/gcc-7.3.0/install/gcc/lib64:/util/academic/gcc/gcc-7.3.0/install/gcc/lib:/util/academic/gcc/gcc-7.3.0/install/mpc-1.1.0/lib:/util/academic/gcc/gcc-7.3.0/install/gmp-6.1.2/lib:/util/academic/gcc/gcc-7.3.0/install/isl-0.18/lib:/util/academic/gcc/gcc-7.3.0/install/mpfr-4.0.1/lib:/util/common/openmpi/3.0.3/gcc-7.3.0/lib:/util/academic/intel/18.3/lib/intel64:/util/academic/intel/20.2/compilers_and_libraries_2020.2.254/linux/mkl/lib/intel64:$LD_LIBRARY_PATH

export PATH=/util/academic/dftbplus/20.2.1-arpack-gcc-7.3.0/bin:/projects/academic/cyberwksp21/Software/dynemol/Dynemol:/util/academic/qe/6.2.1-avx2/bin:/projects/academic/cyberwksp21/Software/ergoscf/3.8/bin:/projects/academic/cyberwksp21/Software/lammps/lammps-29Oct20/src:/projects/academic/cyberwksp21/Software/qxmd/QXMD:/util/academic/cp2k/8.1-sse/cp2k/bin:/util/academic/columbus/7.0_2017-12-07-bin/Columbus:/util/academic/columbus/7.0_2017-12-07-bin:/util/academic/mopac/MOPAC2016_for_CentOS-7:/util/academic/qchem/qc50/bin:/util/academic/qchem/qc50/exe:/util/academic/qchem/qc50/util:/util/academic/java/jdk1.8.0_152/bin:/util/academic/gcc/gcc-7.3.0/install/gcc/bin:/util/common/openmpi/3.0.3/gcc-7.3.0/bin:/util/academic/intel/18.3/bin:/util/academic/intel/20.2/compilers_and_libraries_2020.2.254/linux/mkl/bin:$PATH

#/projects/academic/cyberwksp21/Software/qe/6.7/bin:/projects/academic/cyberwksp21/Software/eqe/eqe-0.2.0/bin:

# Specify BOOST_ROOT to keep warnings to a dull roar at runtime
export BOOST_ROOT=/projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs/libra

# run the ipykernel
exec /projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs/libra/bin/python -m ipykernel $@
