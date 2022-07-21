#!/bin/bash
source /projects/academic/cyberwksp21/Students/smai/Instructors_material/set_openmolcas.sh

#$-N traj_00003



PRIMARY_DIR=/projects/academic/cyberwksp21/Students/jstetzler/SHARC_examples/copy/Tutorial/traj/Singlet_2/TRAJ_00003/

cd $PRIMARY_DIR

$SHARC/sharc.x input
