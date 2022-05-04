eval "$(/projects/academic/cyberwksp21/Software/Conda/Miniconda3/bin/conda shell.bash hook)"
conda create -n libra
conda activate libra
conda install -y conda-build
conda install -y gcc_linux-64
conda install -y gxx_linux-64
conda install -y make
conda install -y boost
conda install -y cmake
conda install -y git
conda install -y -c anaconda h5py
conda install -y -c conda-forge/label/gcc7 eigen
conda install -y -c psi4/label/dev libint2
conda install -y -c anaconda gmp
conda install -y -c conda-forge/label/gcc7 mpfr 
conda install -y python=3.6
conda install -y-c anaconda numpy
conda install -y -c anaconda scipy 
conda install -y -c conda-forge matplotlib
conda install -y -c psi4 psi4
conda install -y -c conda-forge matplotlib
conda install -y -c rmg py3dmol
conda install -y -c conda-forge/label/gcc7 imageio

# export resulting environment spec into pwd
conda env export > libra.yml 

