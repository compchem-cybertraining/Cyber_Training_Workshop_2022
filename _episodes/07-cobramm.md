---
title: "7. COBRAMM"
---


<a name="toc"></a>
# Table of Content


<a name="1"></a>
## 1. Theory and Hands on with COBRAMM
[Back to TOC](#toc)


### 1.1. Slides

* [Overview and Theory of QM/MM](../files/Davide_Avagliano/buffalo_lecture_qmmm.pdf)

* [Hands on](../files/Davide_Avagliano/HANDSON1_DAVIDE.pdf)


### 1.2. Videorecording of the session


#### Afternoon, July 6 section

* Zoom recording 

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=e3eea3f5-55b3-4e3a-a5b0-aeca01663d8a
&autoplay=false&offerviewer=true&showtitle=true&showbrand=true&captions=false&interactivity=all" height="405" width="720" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>

* Webcast

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=352aa1f9-d1f0-495b-8284-aeb501458dc0
&autoplay=false&offerviewer=true&showtitle=true&showbrand=true&captions=false&interactivity=all" height="405" width="720" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>


#### Morning, July 7 section

* Zoom recording 

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=9bbc476b-eb41-4af1-b2c6-aecb013260a4
&autoplay=false&offerviewer=true&showtitle=true&showbrand=true&captions=false&interactivity=all" height="405" width="720" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>

* Webcast

<iframe src="https://ub.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=51083db2-7f9a-49e9-ad12-aeb501454783
&autoplay=false&offerviewer=true&showtitle=true&showbrand=true&captions=false&interactivity=all" height="405" width="720" 
style="border: 1px solid #464646;" allowfullscreen allow="autoplay"></iframe>



### 1.3. Demonstrations and Handson


### 1.4. Instructions 1

#### 1. Add these variables to your .bashrc file

    export COBRAM_PATH=/projects/academic/cyberwksp21/Software/cobramm
    export AMBERHOME=/projects/academic/cyberwksp21/Software/Conda/Miniconda3/envs/ambertools22/
    export PATH=$AMBERHOME/bin:$PATH
    export PATH=$COBRAM_PATH/cobramm:$PATH
    export PATH=$COBRAM_PATH/util:$PATH

  And load it 

    source .bashrc

#### 2. Load modules and activate environment

    module load openbabel
    conda active ambertools22


#### 3. Get the initial files

    git clone https://github.com/compchem-cybertraining/Tutorials_COBRAMM.git
    cd Tutorials_COBRAMM/COBRAMM/solvated_preparation

    [](../fig/cobramm/prepare_cobramm_input.png)

#### 4. Solvation

    python $COBRAM_PATH/util/cobramm-solvatedchromo.py -xyz trans_azobenzene.xyz --solvent methanol -sz 15
   

    [](../fig/cobramm/solvate.png)


#### 5. Equilibration

    python $COBRAM_PATH/util/cobramm-equilibration.py -p trans_azobenzene.top -c trans_azobenzene.crd -opt 10 -ht 1 -et 1

    [](../fig/cobramm/equilibration.png)

#### 6. Droplet

    python $COBRAM_PATH/util/cobramm-droplet.py -p trans_azobenzene.top -c finalsnapshot.crd -sr 12 -mr 4

    [](../fig/cobramm/droplet.png)


#### 1. Link atom example

##### 1. Go to:

    cd Tutorials_COBRAMM/COBRAMM/Rh_preparation/input


#### 2. Run

    ./Prepare_cobramm_input.pl




### 1.4. Homeworks


