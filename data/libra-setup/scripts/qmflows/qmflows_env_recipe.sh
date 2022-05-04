#!/bin/bash

# JMS
# 1 June 21
# assume: Anaconda/Miniconda install in place

# prepare modules and environment
module use /projects/academic/cyberwksp21/Modules
module load jupyter
module load gcc/7.3.0
eval "$(/projects/academic/cyberwksp21/Software/Conda/Miniconda3/bin/conda shell.bash hook)"

# ensure project envs are installed at this location:
export CONDA_ENVS_PATH=/projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs

# verify current conda, python, and versions of same before proceeding
# which conda
# which python
# which gcc
# python --version
# conda info

# create and populate the qmflows conda env
conda create -n qmflows -c conda-forge python=3.7 libint h5py eigen rdkit cython highfive pybind11 scipy numpy matplotlib ipykernel
conda activate qmflows

# install auto-FOX
# requires: python 3.7, rdkit, h5py, matplotlib, (dask optional, not installed here)
pip install git+https://github.com/nlesc-nano/auto-FOX@0.9 --upgrade

# install nano-CAT
# requires: rdkit
pip install git+https://github.com/nlesc-nano/CAT@master --upgrade

# install nano-qmflows
# requires: rdkit cython eigen h5py libint (v2) highfive pybind11
pip install git+https://github.com/SCM-NV/nano-qmflows@master --upgrade

# install data-CAT, nano-CAT
# requires: rdkit, h5py
pip install git+https://github.com/nlesc-nano/nano-CAT@master --upgrade
pip install git+https://github.com/nlesc-nano/Data-CAT@master --upgrade

# export resulting environment spec into pwd
conda env export > qmflows.yml
