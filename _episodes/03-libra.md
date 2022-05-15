---
title: "3. Libra"
---

<a name="toc"></a>
# Table of Content
1. [TSH with model and atomistic Hamiltonians with Libra](#namd-libra)
2. [DVR and grid propagation methods](#dvr-libra)


<a name="namd-libra"></a>
## 1. TSH with model and atomistic Hamiltonians with Libra
[Back to TOC](#toc)

### 1.1. [TSH theory overview](../files/episode_2/Akimov-Libra-namd.pdf)

### 1.2. Videorecording of the session


### 1.3. Demonstrations



### 1.4. Homeworks

   Do the exercises described in the Tutorials above


<a name="dvr-libra"></a>
## 2. DVR and grid propagation methods
[Back to TOC](#toc)

### 2.1. Videorecording of the session

### 2.2. Demonstrations

 * [1_gaussian/1_matrix_elements](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/6_dynamics/4_wavepackets/1_gaussian/1_matrix_elements)
   
   computing matrix elements, exercises
 
 * [2_dvr_basics/tutorial](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/6_dynamics/4_wavepackets/2_dvr_basics) and [4_more/Tutorial1](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/6_dynamics/4_wavepackets/4_more)

   introduce key ideas, some exercises, HDF5 files 

 * [3_soft_propagation/tutorial](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/6_dynamics/4_wavepackets/3_soft_propagation)

   the wrapped up SOFT simulation and visualization


### 2.3. Homeworks

   Do the exercises described in the Tutorials above
   



## 3. [Tutorial](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/6_dynamics/3_heom/1_dynamics_and_lineshapes)

## 4. Homework

  * Explore Hamiltonian or Hamiltonians of your choice with the HEOM method. Explore the convergence 
    with respect to the number of Matsubara frequences and the hierarchy level. 

  * Study the convergence properties for various reorganization energies and bath temperatures


## 1. Constructing MD integrators
[Back to TOC](#toc)

### 1.1. [Presentation](../files/episode_1/Akimov-MD.pdf)

### 1.2. Coding Exercises 

  * Euler MD
  * Leap-frog (coordinate Verlet)
  * Velocity verlet

### 1.3. Libra exmaples

  * [Runge-Kutta for classical MD](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/2_integrators/1_runge_kutta_4th_order)

  * Lattice MD

     `cd /projects/academic/cyberwksp21/Instructors_material/alexeyak/libra/demos_from_libra_code/notebooks/Example4_md/Example1_lattice`

  * Atomistic MD

     `cd /projects/academic/cyberwksp21/Instructors_material/alexeyak/libra/demos_from_libra_code/tests/test_md`


<a name="intro_libra"></a>
## 2. Introduction to Libra
[Back to TOC](#toc)

### 2.1. [Presentation](../files/episode_1/Akimov-Libra-overview.pdf)

### 2.2. Get your copy of tutorials

    git clone https://github.com/compchem-cybertraining/Tutorials_Libra.git

   or 

    cd /projects/academic/cyberwksp21/Instructors_material/alexeyak/libra

### 2.3. Examples 

  * Discuss data types

  * [Runge-Kutta for quantum dynamics](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/2_integrators/2_runge_kutta_4_for_Liouville)

  * Molecular integrals
 
         cd /projects/academic/cyberwksp21/Instructors_material/alexeyak/libra/demos_from_libra_code/tests/test_libint2

  * Built-in Electronic structure calculations: 

         cd /projects/academic/cyberwksp21/Instructors_material/alexeyak/libra/Tutorials_Libra/5_electronic_structure/1_eht/1_compact1

  * Kinetic MC example to model diffusion

         cd /projects/academic/cyberwksp21/Instructors_material/alexeyak/libra/demos_from_libra_code/notebooks/Example5_diffusion

  * random number sampling - section 7.4

  * crystal builder - section 12.1 (may be useful for the nano-qmflows/CAT tutorials)

  * Molecular rotation

         cd /projects/academic/cyberwksp21/Instructors_material/alexeyak/libra/demos_from_libra_code/tests/example_8_rotation

     Exercise: can you combine examples showing py3Dmol, imageio, and the current rotation script to produce the animateg gifs of the
     rotation?

  * define model Hamiltonians and plot properties, HDF5, exercises
`
  * Atomistic interfaces: Psi4 and DFTB+: LiH at CCSD/sto-3G



########## WORKFLOW 

## 1. Step 4: Dynamics

  * [Running the dynamics](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/6_dynamics/2_nbra_workflows/5_step4)

        6_dynamics/2_nbra_workflows/5_step4

## 2. Step 3: Basis transformation and "grooming"

  * [Preliminary transformations: Constructing SP basis, a.k.a. SDs](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/6_dynamics/2_nbra_workflows/4_step3/1_build_SP_basis)

        6_dynamics/2_nbra_workflows/4_step3/1_build_SP_basis

  * [Preliminary transformations: Constructing MB basis, a.k.a. TD-DFT(B)](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/6_dynamics/2_nbra_workflows/4_step3/2_build_MB_basis)

        6_dynamics/2_nbra_workflows/4_step3/2_build_MB_basis

  * [Plotting the properties in SP and MB bases](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/6_dynamics/2_nbra_workflows/5_step4/1_initialize_data)

        6_dynamics/2_nbra_workflows/5_step4/1_initialize_data


<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=7b6b8cdc-7430-4a2b-9713-ad4a01634e2a&
autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="900" width="800" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>



## 3. Step 2: NAC workflows

### 3.1. ErgoSCF

  * [Jupyter demonstrations](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/11_program_specific_methods/1_ergoscf_methods)

        11_program_specific_methods/1_ergoscf_methods

  * [Command-line examples](https://github.com/compchem-cybertraining/Tutorials_ErgoSCF)

        https://github.com/compchem-cybertraining/Tutorials_ErgoSCF

### 3.2. Quantum Espresso

  * [Jupyter demonstration](https://github.com/compchem-cybertraining/Tutorials_Libra/tree/master/6_dynamics/2_nbra_workflows/3_step2_qe)

        6_dynamics/2_nbra_workflows/3_step2_qe

  * [Command-line and Jupyter examples](https://github.com/compchem-cybertraining/Tutorials_QE_and_eQE)

        https://github.com/compchem-cybertraining/Tutorials_QE_and_eQE

### 3.3. DFTB+

  * [Command-line examples](https://github.com/compchem-cybertraining/Tutorials_DFTB_plus)
 
        https://github.com/compchem-cybertraining/Tutorials_DFTB_plus


### 3.4. CP2k

  * [Command-line examples](https://github.com/compchem-cybertraining/Tutorials_CP2K)

        https://github.com/compchem-cybertraining/Tutorials_CP2K

