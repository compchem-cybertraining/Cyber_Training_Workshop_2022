#!/usr/bin/env bash
# For qmflows kernel: setup environment variables, etc.
# From: /projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs/libra/share/jupyter/kernels/qmflows/
#
# codes include:
# ---------------
# - cp2k
#
# compilers include:
# ---------------
# MKL 2020.2
# openmpi 3.0.3/gcc 7.3.0


# compiler paths
# ---------------
# MKL 2020.2
export MKL=/util/academic/intel/20.2/compilers_and_libraries_2020.2.254/linux/mkl
export MKLROOT=/util/academic/intel/20.2/compilers_and_libraries_2020.2.254/linux/mkl
export MKL_TARGET_ARCH=intel64

# openmpi 3.0.3/gcc 7.3.0
export OMPI=/util/common/openmpi/3.0.3/gcc-7.3.0

# Java 1.8.0
#   openmpi
export JAVA_HOME=/util/academic/java/jdk1.8.0_152

#export PYTHONPATH=/projects/academic/cyberwksp21/Software/Libra/_build/src:/util/academic/dftbplus/20.2.1-arpack-gcc-7.3.0/lib/python3.6/site-packages:$PYTHONPATH
export PYTHONPATH=/projects/academic/cyberwksp21/Software/Libra/_build/src:/projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs/libra/bin:$PYTHONPATH


export LD_LIBRARY_PATH=/util/common/openmpi/3.0.3/gcc-7.3.0/lib:/util/academic/intel/20.2/compilers_and_libraries_2020.2.254/linux/mkl/bin:$LD_LIBRARY_PATH

export PATH=/util/academic/cp2k/8.1-sse/cp2k/bin:/util/academic/java/jdk1.8.0_152/bin:/util/common/openmpi/3.0.3/gcc-7.3.0/bin:/util/academic/intel/20.2/compilers_and_libraries_2020.2.254/linux/mkl/lib/intel64:$PATH

# Specify BOOST_ROOT to keep warnings to a dull roar at runtime
export BOOST_ROOT=/projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs/qmflows

# run the ipykernel
exec /projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs/qmflows/bin/python -m ipykernel $@
