---
title: "6. SHARC"
---

## 1. Presentations

* [Theory lecture "From Fewest-Switches Surface Hopping to Surface Hopping including Arbitrary Couplings and a Brief Overview over Practical Aspects"](https://github.com/compchem-cybertraining/Cyber_Training_Workshop_2022/blob/gh-pages/files/Sebastian_Mai/lecture_2_SHARC.pdf)
* [Hands-on task sheet "Preparation of Surface Hopping Trajectories with SHARC and OpenMolcas"](https://github.com/compchem-cybertraining/Cyber_Training_Workshop_2022/blob/gh-pages/files/Sebastian_Mai/handson_2_SHARC_setup.pdf)
* [Theory lecture "Excited States with Time-Dependent Density Functional Theory and with Linear Vibronic Coupling Models"](https://github.com/compchem-cybertraining/Cyber_Training_Workshop_2022/blob/gh-pages/files/Sebastian_Mai/lecture_3_TDDFT_LVC.pdf)
* [Hands-on task sheet "Preparation and Execution of Surface Hopping Trajectories with SHARC and Linear Vibronic Coupling Models for Sulfur Dioxide"](https://github.com/compchem-cybertraining/Cyber_Training_Workshop_2022/blob/gh-pages/files/Sebastian_Mai/handson_3_LVC.pdf)
* [Application lecture "Trajectory Ensemble Analysis with SHARC"](https://github.com/compchem-cybertraining/Cyber_Training_Workshop_2022/blob/gh-pages/files/Sebastian_Mai/lecture_4_SHARC_analysis.pdf)
* [Hands-on task sheet "Analysis of Surface Hopping Trajectories obtained with SHARC and OpenMolcas"](https://github.com/compchem-cybertraining/Cyber_Training_Workshop_2022/blob/gh-pages/files/Sebastian_Mai/handson_4_SHARC_analysis.pdf)



## 2. Installation and execution

The SHARC package can be obtained from https://sharc-md.org/ and https://github.com/sharc-md/sharc/tree/master/bin.
Please see manual for details on the general installation procedure.
For installing pysharc, you can check the instructions on https://github.com/schnarc/SchNarc.
However, if you do not need the machine learning packages, then you can create a simpler anaconda environment like this:
"conda create -n pysharc python=2.7 numpy scipy h5py six matplotlib python-dateutil pyyaml pyparsing kiwisolver cycler netcdf4 hdf5 h5utils gfortran_linux-64"
This anaconda environment is already installed for the Workshop.
