#!/bin/bash
source /projects/academic/cyberwksp21/Students/smai/Instructors_material/set_openmolcas.sh

#$-N traj_00005



PRIMARY_DIR=/projects/academic/cyberwksp21/Students/jstetzler/SHARC_examples/copy/Tutorial/traj/Singlet_3/TRAJ_00005/

cd $PRIMARY_DIR

$SHARC/sharc.x input
