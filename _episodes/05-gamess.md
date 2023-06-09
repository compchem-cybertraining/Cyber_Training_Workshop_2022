---
title: "5. Spin-Restricted Ensemble-Referenced Kohn-Sham (REKS) Method: Practical Implementation of Ensemble DFT Methodology"
---

<a name="toc"></a>
# Table of Content
1. [Theory: Introduction in ensemble DFT and basic aspects of REKS method for ground electronic states](#1) - **June 16, morning**

    1.1. [The concept of electron correlation](#1.1)

    1.2. [Dynamic vs non-dynamic correlation](#1.2)

    1.3. [Examples of strong non-dynamic correlation](#1.3)

    1.4. [Density functional theory and Kohn-Sham method](#1.4)

    1.5. [Ensemble DFT](#1.5)

    1.6. [Practical implementation of eDFT in REKS(2,2) method](#1.6)

    1.7. [Extension of REKS method beyond (2,2) active space](#1.7)

    1.8. [Examples of application of REKS method to bond dissociation](#1.8)

2. [Hands on: REKS implementation in GAMESS-US; Demos and practical exercises with REKS method for strongly correlated molecular ground states](#2) -  **June 16, afternoon**

    2.1. [Overview of REKS implementation in GAMESS-US](#2.1)

    2.2. [Interfacing GAMESS-US with DL-FIND](#2.2)

    2.3. [Environment setup and submitting jobs in SLURM](#2.3)

    2.4. [Practical example: TME diradical](#2.4)

    2.5. [Optimization of ground state minima with DL-FIND](#2.5)

    2.6. [Optimization of NEB path with DL-FIND](#2.6)

3. [Theory: Ensemble DFT for excited states and its implementation in state-averaged REKS methodology](#3) - **June 19, morning**

    3.1. [Excited states and non-adiabatic dynamics](#3.1)

    3.2. [DFT and excited states](#3.2)

    3.3. [Ensemble DFT for excited states](#3.3)

    3.4. [Practical implementation of eDFT in SA-REKS and SSR methods](#3.4)

    3.5. [Applications of SSR method](#3.5)

    3.6. [SSR method with extended active space](#3.6)

4. [Hands on: Practical exercises with GAMESS-US and NAMD simulations with GAMESS/pyUNI-xMD package](#4) - **June 19, afternoon**

    4.1. [Excited state decay in PSB3](#4.1)

    4.2. [pyUNI-xMD and its interface with SSR/GAMESS-US](#4.2)

    4.3. [Optimization of S<sub>0</sub> and S<sub>1</sub> stationary points (SSR/DL-FIND)](#4.3)

    4.4. [Setting up initial conditions (Newton-X)](#4.4)

    4.5. [Preparing the input data for pyUNI-xMD](#4.5)

    4.6. [Running the simulations](#4.6)


<a name="1"></a>[Back to TOC](#toc)
## 1. Theory: Introduction in ensemble DFT and basic aspects of REKS method for ground electronic states. (180 min)

[Slides](../files/Michael_Filatov/REKS-June16.pdf)


<a name="2"></a>[Back to TOC](#toc)
## 2.  Hands on: REKS implementation in GAMESS-US; Demos and practical exercises with REKS method for strongly correlated molecular ground states

[Slides](../files/Michael_Filatov/HandsOn.pdf)

<a name="2.3"></a>
### 2.3. For environment setup and sample files, refer to /projects/academic/cyberwksp21/Software/mfilatov


<a name="3"></a>[Back to TOC](#toc)
## 3.  Theory: Ensemble DFT for excited states and its implementation in state-averaged REKS methodology (180 min)

[Slides](../files/Michael_Filatov/REKS-June19.pdf)


<a name="4"></a>[Back to TOC](#toc)
## 4.  Hands on: Practical exercises with GAMESS-US and NAMD simulations with GAMESS/pyUNI-xMD package

[Slides](../files/Michael_Filatov/HandsOn.pdf)
