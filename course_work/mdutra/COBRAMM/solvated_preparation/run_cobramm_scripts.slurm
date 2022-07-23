#!/bin/bash
#SBATCH --partition=valhalla  --qos=valhalla
#SBATCH --clusters=faculty
#SBATCH --nodes=1
#SBATCH --requeue
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST="$SLURM_JOB_NODELIST
echo "SLURM_NNODES="$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory="$SLURM_SUBMIT_DIR

home_dir=$PWD 

module load openmpi/3.0.3/gcc-7.3.0
module load openbabel

export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so
if [ -n "$SLURM_CPUS_PER_TASK" ]; then
  omp_threads=$SLURM_CPUS_PER_TASK
else
  omp_threads=1
fi
export OMP_NUM_THREADS=$omp_threads

if [ -d "test_cobramm_dir" ]; then
   if [ ! -z "$(ls -A test_cobramm_dir)" ]; then
      rm test_cobramm_dir/*
   fi
else
   mkdir test_cobramm_dir
fi

cp * test_cobramm_dir

cd test_cobramm_dir

#scratch_dir=molcas_$SLURM_JOB_ID 
#export MOLCAS_NPROCS=1 
#export MOLCAS_WORKDIR=$CINECA_SCRATCH/$scratch_dir 
 
export COBRAM_PATH="/projects/academic/cyberwksp21/Software/cobramm"
export AMBERHOME=/user/davagliano/.conda/envs/CobrammAmber/

srun python $COBRAM_PATH/util/cobramm-equilibration.py -p trans_azobenzene.top -c trans_azobenzene.crd >> out 2>> err

cp -r * $home_dir 
