---
title: "9. NEXMD (Nonadiabatic EXcited-state Molecular Dynamics"
date: June 18, 2021, 11:00 am - 5:00 pm EDT
---

NEXMD is a program for excited-state molecular dynamics. It includes efficient algorithms 
for nonadiabatic dynamics of molecules in dielectric environments. It is written in Fortran 90, 
with scripts in Python 2.7 for preparing input files and running the program on parallel systems.


## 1. [Theory presentation](../files/Tretiak-nexmd.pdf)

## 2. Video recording of the theory presentation

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=56c3bcfa-1d7e-4d3d-ab0e-ad4c0008c136&
autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="900" width="800" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>


## 3. Setup of the NEXMD code


## 3.1. Github Link

NEXMD can be downloaded for free [on Github](https://github.com/lanl/NEXMD/)


## 3.2. Usage

The program is run by ```./nexmd``` in a working directory which includes the input file ```input.ceon```. 

Input files for multiple trajectories can be prepared using the getexcited.py script.


### 3.2.1. Prerequisites

The following packages must be installed and configured locally:
* BLAS [http://www.netlib.org/blas/]
* LAPACK [http://www.netlib.org/lapack]

### 3.2.2. Set-up

Run ```Make ic or Make gnu``` to compile the program. 

### 3.2.3. Run

Run ```nexmd.exe > [output file]``` in the directory with input.ceon. 

The code is usually run in trivially parallel form with multiple trajectories prepared with the getexcited.py script. 

See the included manual for more information. (add more)


## 4. Hands on exercises with the NEXMD code

### 4.1. Introduction

NEXMD simulates the photoinduced adiabatic and non-adiabatic ground- and excited-state molecular 
dynamics of organic chromophores. It uses the CEO (collective electronic oscillator) package with a 
variety of semiempirical methods from the SQM package. Tully’s fewest-switches surface hopping approach 
to quantum transitions is employed, with instantaneous decoherence and a Min-Cost algorithm for the detection 
of trivial unavoided crossings. Several TDSCF (time-dependent self-consistent field) QM/continuum models are 
available for including the effects of a solvent.

### 4.2. [Practice presentation](../files/Malone-nexmd.pdf)


### 4.3. Lesson Plan

*  Introduction and Compilation
*  Basic Functions
	* SCF Convergence
	* Geometry optimization
	* Excited state structure
		* CIS vs RPA
	* Excited state optimization
	* Adiabatic dynamics in ground and S1 state
		* Newtonian Dynamics vs Langevin Dynamics
	* Dynamics in the present of solvent
		* Linear response vs Vertical excitation vs State-specific
*  Nonadiabatic Dynamics
	*  Single Trajectory
		*  Decoherence, surface hopping dynamics 
	*  Ground State Trajectory
	*  Single Point Calculation Setup
	*  Generating an Optical Spectrum 
	*  Setting Up and Running a Swarm of Trajectories
	*  Analysis
		*  Population Analysis
		*  Geometry Analysis
		*  Transition Density Analysis
		*  NACT Analysis
		*  PES Analysis
*  Bonus Development Features

### 4.4. Video recording

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=6701e922-1ea9-4c31-a63b-ad4c0008a62b&
autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="900" width="800" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>


