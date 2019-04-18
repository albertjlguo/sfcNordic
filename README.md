[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/realgjl/Nordic-Test-System/master)

### Start
Open JupyterLab via Anaconda, move to [example folder](https://github.com/realgjl/Nordic-Test-System/tree/master/examples) and find [**example_testing.ipynb**](https://github.com/realgjl/Nordic-Test-System/blob/master/examples/example_testing.ipynb)


### Environment
1. Windows / Linux;
2. Download the latest version from the [GitHub repository](https://github.com/realgjl/Nordic-Test-System);
3. Packages or Libraries:
	- [numpy](http://www.numpy.org/)
	- [pandas](https://pandas.pydata.org)
	- [PyRAMSES](https://ramses.paristidou.info)

4. For the libraries above, they should be downloaded automatically via conda through 'environment.yml' excluding for gnuplot:
	1. Download the GZ file and unzip somewhere on your drive (for instance on the Desktop) from [gnuplot](https://sourceforge.net/projects/gnuplot/files/gnuplot/5.2.5/) or [this link](https://www.dropbox.com/s/qqr0yarrag3e9ia/gnuplot.zip?dl=0); 
	2. Add the directory to gnuplot/bin in your [user path](https://support.microsoft.com/en-gb/help/931715/you-cannot-modify-user-environment-variables-in-the-system-properties). For instance, C:\Users\el17jg\Desktop\gnuplot\bin.

### Data: Nominal Power from [dyn_A.dat](https://github.com/realgjl/sfcNordic/blob/master/examples/dyn_A.dat) (SYNC_MACH)
| Generator | Nominal Power (MW)| Nominal Power (MW) (g8)|
|-----------|-------------------|------------------------|
| g1        | 760.0             |                        |
| g2        | 570.0             |                        |
| g3        | 665.0             |                        |
| g4        | 570.0             |                        |
| g5        | 237.5             |                        |
| **g6**    | **360.0**         | **468.0**              |
| **g7**    | **180.0**         | **234.0**              |
| g8        | 807.5             |                        |
| g9        | 950.0             |                        |
| g10       | 760.0             |                        |
| g11       | 285.0             |                        |
| g12       | 332.5             |                        |
| g13       | 0.0               |                        |
| **g14**   | **630.0**         | **819.0**              |
| **g15**   | **1080.0**        | **1404.0**             |
| **g16**   | **630.0**         | **819.0**              |
| g17       | 540.0             | 640.0                  |
| g18       | 1080.0            |                        |
| g19       | 475.0             |                        |
| g20       | 4275.0            |                        |


### Documentation
RAMSES documentation is [here](https://ramses.paristidou.info/interfaces/python/getting_started.html).

### Reference
1. [PES_TR19_Test-Systems-for-Voltage-Stability-Analysis-and-Security-Assessment1.pdf](https://github.com/realgjl/Nordic-Test-System/blob/master/reference%20(pdf)/PES_TR19_Test-Systems-for-Voltage-Stability-Analysis-and-Security-Assessment1.pdf) (Page 12: Nordic Grid map);

2. [PID control from Caltech](https://github.com/realgjl/sfcNordic/blob/master/reference%20(pdf)/Caltech%20PID%20Control.pdf);

3. My [Interim Report](https://github.com/realgjl/Nordic-Test-System/blob/master/reference%20(pdf)/interim%20report.pdf);

4. [eth - Deterministic Sizing of the Frequency Bias Factor of Secondary Control.pdf](https://github.com/realgjl/Nordic-Test-System/blob/master/reference%20(pdf)/eth%20-%20Deterministic%20Sizing%20of%20the%20Frequency%20Bias%20Factor%20of%20Secondary%20Control.pdf) & [eth-Frequency Control in the European Power System Considering the Organisational Structure and Division of Responsibilities.pdf](https://github.com/realgjl/Nordic-Test-System/blob/master/reference%20(pdf)/eth-Frequency%20Control%20in%20the%20European%20Power%20System%20Considering%20the%20Organisational%20Structure%20and%20Division%20of%20Responsibilities.pdf);

5. [Delay-Robust Distributed Secondary Frequency Control: A Case Study] (http://eprints.whiterose.ac.uk/144279/8/PID5849209.pdf), Alghamdi, S, Smith, N, Schiffer, J, Aristidou, P.

### License

Nordic-Test-System is licensed under GPLv3. See [LICENSE.txt](https://github.com/realgjl/Nordic-Test-System/blob/master/LICENSE.txt) for more details.
