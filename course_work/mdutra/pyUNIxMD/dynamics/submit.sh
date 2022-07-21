#!/bin/sh
#SBATCH --job-name=pyunixmd
#SBATCH --partition=valhalla  --qos=valhalla
#SBATCH --clusters=faculty
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --mem=500

# Set the nr. threads for dftb-omp
export OMP_NUM_THREADS=1

# Set a scratch directory
export SCRADIR=/panasas/scratch/grp-cyberwksp21/$USER/dyn_$SLURM_JOB_ID

mkdir $SCRADIR

cp $SLURM_SUBMIT_DIR/* $SCRADIR 
ln -s $SCRADIR ./SCRADIR
cd $SCRADIR

srun python run_Shin-Metiu.py >log
#srun python run_SAC.py >log

cp * $SLURM_SUBMIT_DIR
cp -r md/ $SLURM_SUBMIT_DIR
#rm -rf $SCRADIR
