---
title: "7. CAT and FOX workflows"
date: June 17, 2021, 11:00 am - 1:00 pm EDT
---


# Tutorial
<a name="toc"></a>

0. [Setup](#setup)
1. [The qd_build workflow](#qd_build)
2. [The fitting workflow](#fitting)
3. [Video recording](#video)

## 0. Setup
<a name="setup"></a> [Back to TOC](#toc)

In your working directory, copy the folder containing all the files required for this tutorial:

    cp -r /projects/academic/cyberwksp21/Instructors_material/rpascazio/exercises/ .

Please refer to the following documentations:
1. The Building a Quantum Dot Model assignment is based on the [CAT documentation](https://cat.readthedocs.io/en/latest/) and on the [Building a Quantum Dot Model Tutorial](https://nanotutorials.readthedocs.io/en/latest/1_build_qd.html);
2. The Forcefield Optimization assignment is based on the [Auto-FOX documentation](https://auto-fox.readthedocs.io/en/latest/) and on the [Forcefield Optimization Tutorial](https://nanotutorials.readthedocs.io/en/latest/2_fitting.html).

## 1. Building a Quantum Dot Model
<a name="qd_build"></a> [Back to TOC](#toc)

We aim to create nanocrystals from a charge-balanced Cd68Se68 core. Use the corresponding `CdSe.xyz` file in your `1_qd_build` directory to:
1. Replace a 30% fraction of the Se ions in the model with Cl dummies in a file called `CdSe_30Cl.xyz` with random distribution and use the file to replace the Cl on the surface with stearate anions.
2. Replace a 20% fraction of the Cd ions in the model with Na dummies in a file called `CdSe_20Na.xyz` with clustered distribution and use the file to replace the Na on the surface with oleylammonium cations.
(Suggestion: their SMILES strings are available on [PUBCHEM](https://pubchem.ncbi.nlm.nih.gov/)).

## 2. The fitting workflow
<a name="fitting"></a> [Back to TOC](#toc)

We aim to fit the classical forcefield parameters of a CsPbBr3 core from a previous QM-MD trajectory using the [Adaptive Rate Monte Carlo (ARMC) algorithm](https://auto-fox.readthedocs.io/en/latest/4_monte_carlo.html).
1. Modify the yaml script to fit the `CsPbBr3_MD.xyz` trajectory (you can find them in your `2_fitting` directory).
Use the oxidation states of the atoms (respectively 1.0, 2.0, -1.0 for Cs, Pb, Br) as starting parameters for their charges, and modify the `guess_rdf.py` script in the `scripts` subdirectory to obtain the starting values for the sigmas. (Beware of the units and of the constraints!). Run the parametrization for around 5/10 steps (Suggestion: use the  `logfile` to check the number of last iteration). Use the python scripts in the `scripts` subdirectory to plot the errors of the ARMC and the Radial Distribution Functions (RDFs) of the best step from the `armc.hdf5` file. What do the plots show? Why? (Suggestion: take a look at the errors in the `logfile`!)
2. Adjust the parameters to obtain a "better" fitting and repeat the same procedure for 5/10 more steps (don't forget to rename your previous `MM_MD_workdir` beforehand). What do the plots look like now? How do you expect them to change over time?

## 3. Video recording
<a name="video"></a> [Back to TOC](#toc)

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=fb815f2c-aab6-4d16-a7f3-ad4a0163057b&
autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="900" width="800" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>


