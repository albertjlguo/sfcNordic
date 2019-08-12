# Secondary Frequency Control (SFC)/ Automatic Generation Control (AGC) in Nordic grid

## Installing applications and libraries with Conda
### Download the [Miniconda installer](https://repo.continuum.io/miniconda/)
At a command prompt, enter (Mac):
```terminal
curl -o ./Miniconda3-latest-MacOSX-x86_64.sh -k https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
```
In Linux (Ubuntu, CentOS, ...):
```terminal
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
```

### Run the installer
Mac:
```terminal
bash Miniconda3-latest-MacOSX-x86_64.sh
```
Linux:
```terminal
bash Miniconda3-latest-Linux-x86_64.sh
```

### Setting the install directory
Follow the prompts on the installer screens.

If you are unsure about any setting, accept the defaults. You can change them later.

To make the changes take effect, close and then re-open your terminal window.

To test your installation, in your terminal window or Anaconda Prompt, run the command ```conda list```.

For a successful installation, a list of installed packages appears.

### Configuring Conda
Before first use, the conda package management system needs some initial configuration.

Make sure all the components are updated to their latest versions by entering:
```terminal
conda update conda
```
at the command prompt. If there are any updates, you will be prompted to agree their installation.

Add the a number of channels. This step is required so that the conda installer knows where to get the installation files for your applications from. At the command prompt:
```terminal
conda config --add channels conda-forge
conda config --add channels anaconda
conda config --add channels apetros
```

### Installing Python packages and applications
#### [scipy](https://anaconda.org/anaconda/scipy)
It's preferred to install [scipy](https://anaconda.org/conda-forge/scipy) instead of independently installing numpy, mkl and other independencies. Scipy will automatically install packages like intel-openmp, mkl, mkl-service, numpy and blas.
```terminal
conda install -c anaconda scipy
```
![](https://i.loli.net/2019/07/29/5d3df74fda1a288903.png)
#### [jupyterlab](https://anaconda.org/conda-forge/jupyterlab)
```terminal
conda install -c conda-forge jupyterlab
```
To make sure that you have the MKL libraries installed, you can test via ipython:
```terminal
ipython
```

```python
import numpy as np
np.__config__.show()
```
"blas_mkl_info" should NOT shown as "not available", like:
```python
mkl_info:
    libraries = ['mkl_rt', 'pthread']
    library_dirs = ['/home/home01/el17jg/miniconda3/lib']
    define_macros = [('SCIPY_MKL_H', None), ('HAVE_CBLAS', None)]
    include_dirs = ['/home/home01/el17jg/miniconda3/include']
```

#### [matplotlib](https://anaconda.org/conda-forge/matplotlib)
```terminal
conda install -c conda-forge matplotlib 
```

#### [pyramses](https://pypi.org/project/pyramses/)
```terminal
conda install -c apetros pyramses
```
Test if pyramses is in your path via ipython:
```python
import pyramses
ram = pyramses.sim()
```
Alternatively, you can install pyramses via [pypi](https://pypi.org/project/pyramses/).

### Other package(s) and application(s)
#### intel
If the error "libifport.so.5: : cannot open shared object file" occurs, you may have to install Intel's redistributables package.
You can review this [intel's forum](https://software.intel.com/comment/1942377) as a reference.

#### gnuplot
You may need to install [gnuplot](https://sourceforge.net/projects/gnuplot/files/gnuplot/) although it is not necessary if you remote to a supercomputer.
 You can choose to use gnuplot or not in `~/settings.dat`:
 ```dat
 $CALL_GP F;
 $CALL_GP T;
 # $CALL_GP F;
 ```

## Start
1. Clone this respository;
2. Move to [examples](https://github.com/realgjl/sfcNordic/tree/master/examples) folder, start with nordic.ipynb

## Frequency and Power
![](https://i.loli.net/2019/05/19/5ce09912785a964695.jpg)

## Some Reference
1. [PES_TR19_Test-Systems-for-Voltage-Stability-Analysis-and-Security-Assessment1.pdf](https://github.com/realgjl/Nordic-Test-System/blob/master/reference%20(pdf)/PES_TR19_Test-Systems-for-Voltage-Stability-Analysis-and-Security-Assessment1.pdf) (Page 12: Nordic Grid map);

2. [PID control from Caltech](https://github.com/realgjl/sfcNordic/blob/master/reference%20(pdf)/Caltech%20PID%20Control.pdf);

3. My [Interim Report](https://github.com/realgjl/Nordic-Test-System/blob/master/reference%20(pdf)/interim%20report.pdf);

4. [eth - Deterministic Sizing of the Frequency Bias Factor of Secondary Control.pdf](https://github.com/realgjl/Nordic-Test-System/blob/master/reference%20(pdf)/eth%20-%20Deterministic%20Sizing%20of%20the%20Frequency%20Bias%20Factor%20of%20Secondary%20Control.pdf) & [eth-Frequency Control in the European Power System Considering the Organisational Structure and Division of Responsibilities.pdf](https://github.com/realgjl/Nordic-Test-System/blob/master/reference%20(pdf)/eth-Frequency%20Control%20in%20the%20European%20Power%20System%20Considering%20the%20Organisational%20Structure%20and%20Division%20of%20Responsibilities.pdf);

5. [Delay-Robust Distributed Secondary Frequency Control: A Case Study](http://eprints.whiterose.ac.uk/144279/8/PID5849209.pdf), Alghamdi, S, Smith, N, Schiffer, J, Aristidou, P.

# License

Nordic-Test-System is licensed under GPLv3. See [LICENSE.txt](https://github.com/realgjl/Nordic-Test-System/blob/master/LICENSE.txt) for more details.
