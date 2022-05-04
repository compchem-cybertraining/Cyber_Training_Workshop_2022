---
title: "10. QXMD : ab initio Molecular Dynamics Simulation Package."
date: June 21, 2021, 11:00 am - 2:00 pm EDT
---

**QXMD** is a scalable, parallel program for Quantum Molecular Dynamics simulations with various eXtensions. 
Its simulation engine is based on (time-dependent) density functional theory using pseudopotentials and 
plane-wave basis, while extensions include nonadiabatic electron-nuclei dynamics and multiscale shock technique.

**QXMD** serves as a community-development platform for new methods and algorithms, a research platform on high-end
parallel supercomputers, and an educational platform for hands-on training.

## 0. [Theory presentation](../files/Nakano-Linker-qxmd.pdf)

## 1. Theory video recording

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=480e477a-e21d-4bdd-ac99-ad4e01349e44&
autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="900" width="800" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>

## 2. Hands-on video recording

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=f87df9aa-1230-4382-9650-ad4e0133ca48&
autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="900" width="800" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>
 
## 3. Hands on details

### 3.1. Prerequisites
The parallel version of **QXMD** requires a Fortran compiler, as well as FFT and MPI libraries. 
There are no other library requirements for the QXMD. To run on UB center be sure to load the following modules.

    module load intel/18.4

    module load intel-mpi/2018.4

In /projects/academic/cyberwksp21/Software/qxmd/QXMD/ there are two executables:
     
 * qxmd    -- Serial Version of QXMD
      
 * qxmdmpi -- Parallel Version of QXMD

`module load qxmd` should give acess to both executables.

### 3.2. How to run

For the tutorials please copy the `Examples` and `LIB` folder from `/projects/academic/cyberwksp21/Software/qxmd/QXMD/` 
to your working directory. 


In order to run QXMD, there are a few mandatory directories and files that must be present and in the correct hierarchy. 
The folders in the `Examples/` directory are allready configured to do so. The working directory, from which a `QXMD`
job is launched must contain a directory called `data/`, where all output data will be dumped, as well as a directory 
called `control/`, which must contain the following:

 * CONFIG: a configuration file detailing the atomic coordinates of the system to be simulated
 * filename: a simple text file containing the path to the main input file
 * IN.PARAM: an input parameter file with various settings for the dynamics simulation 
 * VELOC: an optional initial velocity files containing the initial three component velocities for each atom in the system
 * NCPP/ or PAW/ or USPP/: a directory containing pseudopotential files for each atomic species in the system. 

There are many example input files for various types of simulations in the `Examples/` directory, 
including optimization of water, adiabatic QMD of water in the canonical ensemble, non-adiabatic QMD of monolayer MoSe2
 in the microcanonical ensemble, and a MSST simulation of Si.

The NAQMD and MSST examples are explained in more detail in the [QXMD manual](https://usccacs.github.io/QXMD/index.html).

To learn more about QXMD, please refer to [QXMD manual](https://usccacs.github.io/QXMD/index.html).


### 3.3. License
This project is licensed under the GPU 3.0 license - see the [LICENSE](https://github.com/USCCACS/QXMD/blob/master/LICENSE) 
file for details


### 3.4. Relevant publications

1) [F. Shimojo, Y. Zempo, K. Hoshino, and M. Watabe, "First-principles molecular-dynamics simulation of expanded liquid 
rubidium," Physical Review B, vol. 52, pp. 9320-9329, Oct 1 1995.](https://doi.org/10.1016/S0022-3093 00322-5)

2) [F. Shimojo, S. Hattori, R. K. Kalia, M. Kunaseth, W. Mou, A. Nakano, et al., "A divide-conquer-recombine 
algorithmic paradigm for large spatiotemporal quantum molecular dynamics simulations," Journal of Chemical 
Physics, vol. 140, 18A529, May 14, 2014.](https://doi.org/10.1063/1.4869342)

3) [F. Shimojo, S. Fukushima, H. Kumazoe, M. Misawa, S. Ohmura, P. Rajak, K. Shimamura, L. Bassman, S. Tiwari, 
R. K. Kalia, A. Nakano, and P. Vashishta, "QXMD: an open-source program for nonadiabatic quantum 
molecular dynamics," SoftwareX, vol. 10, 100307, July 26 2019.](https://doi.org/10.1016/j.softx.2019.100307)


## 4. Homework/Exercises:

* https://aiichironakano.github.io/cs699-assgn.html


