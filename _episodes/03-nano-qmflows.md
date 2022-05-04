---
title: "3. Qmflows and Nano-qmflows workflows"
date: June 15, 2021, 11:00 am - 1:00 pm EDT
---

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=329cdc4f-71db-4443-b020-ad48016a3e97&
autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="900" width="800" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>

# Tutorial
<a name="toc"></a>

0. [Setup](#setup)
1. [The single_points workflow](#single_points)
2. [The absorption_spectrum workflow](#absorption_spectrum)
3. [The distribute_derivative_couplings workflow](#derivative_couplings)

## 0. Setup
<a name="setup"></a> [Back to TOC](#toc)

In your working directory, copy the folder containing all the files you will need for this tutorial:

    cp -r /projects/academic/cyberwksp21/Instructors_material/jzito/nano-qmflows/ .

Please refer to the [nano-qmflows’s documentation](https://qmflows-namd.readthedocs.io/en/latest/) to complete 
the following assignments.


## 1. The single_points workflow
<a name="single_points"></a> [Back to TOC](#toc)

A single point calculation on the relaxed geometry of a Cd33Se33 system has been performed according to 
the [Single points calculation's tutorial](https://qmflows-namd.readthedocs.io/en/latest/single_points.html) 
(see the corresponding input file in your `1_single_points` directory).

Use the provided `Cd33Se33.hdf5` file to:

1. Calculate the HOMO-LUMO gap in eV.
2. Plot the energy (in eV) of the Kohn-Sham orbitals considered in the active space.
 (Suggestion: use [matplotlib.pyplot.barh](https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.pyplot.barh.html))


## 2. The absorption_spectrum workflow
<a name="absorption_spectrum"></a> [Back to TOC](#toc)

Calculate the oscillator strength of the lowest lying excited states of our Cd33Se33 system within
 the single orbital transitions approximation.

To do that, edit the input file `absorption_spectrum_Cd33Se33.yml` provided in the directory
 `2_absorption_spectrum` according to the previous requirements (consult the tutorial 
[Absorption Spectrum](https://qmflows-namd.readthedocs.io/en/latest/absorption_spectrum.html)), then 
submit your calculation using the `launch.sh` submission script. Use the provided `Cd33Se33.hdf5` file.

Once the calculation is completed, copy locally the result file `output_0_sing_orb.txt` from your 
scratch directory and interpret it using 
the [last part](https://qmflows-namd.readthedocs.io/en/latest/absorption_spectrum.html#results) of the tutorial.

1. How many singly excited configurations do you expect to find there?
2. What is the energy of the first excited state within the single orbital approximation? Is this result in line with the previous exercise?
3. Plot the absorption spectrum for the Cd33Se33 system in the energy interval 0-2 eV using a sigma value of 0.1. (Suggestion: Import the `convolute` function with `from nanoqm.analysis import convolute` and have a look at the script [`convolution.py`](https://github.com/SCM-NV/nano-qmflows/blob/master/scripts/qmflows/convolution.py#L45-L52))


## 3. The distribute_derivative_couplings workflow
<a name="#derivative_couplings"></a> [Back to TOC](#toc)

In the directory `3_derivative_couplings`, you will find the input 
file `distribute_derivative_couplings_Cd33Se33.yml` that has been used to distribute the 
last twenty points of a ground state molecular dynamics trajectory for the Cd33Se33 
system (`Cd33Se33_MD_last20.xyz`) into four chunks. For each chunk, the values of the 
overlaps and couplings have been calculated and stored, respectively, in 
the files `chunk_0.hdf5`, `chunk_1.hdf5`, `chunk_2.hdf5` and `chunk_3.hdf5`. 
Follow the [Derivative Couplings tutorial](https://qmflows-namd.readthedocs.io/en/latest/derivative_couplings.html#merging-the-chunks-and-recalculating-the-couplings) to merge these files into a unique `chunk_0123.hdf5` file and calculate the overlaps and couplings amongst the missing pairs of points.

1. How many couplings are missing and need to be calculated? How many couplings would you expect to find in the final updated `chunk_0123.hdf5`?
2. Use the updated `chunk_0123.hdf5` to plot the dependence of the energy (in eV) of the LUMO and LUMO+1 over time.
3. Use the updated `chunk_0123.hdf5` to the retrieve the LUMO-LUMO+1 overlaps and couplings and plot their value in time.

