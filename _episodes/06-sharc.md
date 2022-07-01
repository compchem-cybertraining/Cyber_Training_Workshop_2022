---
title: "6. SHARC"
---

## 1. Presentations

Theory lecture "From Fewest-Switches Surface Hopping to Surface Hopping including Arbitrary Couplings and a Brief Overview over Practical Aspects"

Hands-on task sheet "Preparation of Surface Hopping Trajectories with SHARC and OpenMolcas"

Theory lecture "Excited States with Time-Dependent Density Functional Theory and with Linear Vibronic Coupling Models"

Hands-on task sheet "Preparation and Execution of Surface Hopping Trajectories with SHARC and Linear Vibronic Coupling Models for Sulfur Dioxide"

Application lecture "Trajectory Ensemble Analysis with SHARC"

Hands-on task sheet "Analysis of Surface Hopping Trajectories obtained with SHARC and OpenMolcas"


## 2. Installation and execution

The SHARC package can be obtained from https://sharc-md.org/ and https://github.com/sharc-md/sharc/tree/master/bin.
Please see manual for details on the general installation procedure.
For installing pysharc, you can check the instructions on https://github.com/schnarc/SchNarc.
However, if you do not need the machine learning packages, then you can create a simpler anaconda environment like this:
"conda create -n pysharc python=2.7 numpy scipy h5py six matplotlib python-dateutil pyyaml pyparsing kiwisolver cycler netcdf4 hdf5 h5utils gfortran_linux-64"
This anaconda environment is already installed for the Workshop.
