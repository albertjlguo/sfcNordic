### Original files
1. cmd.txt
2. dyn_A.dat
3. obs.dat
4. setting1.dat
5. short\_trip_branch.dst
6. temp_display.plt
7. volt\_rat_A.dat

### Algorithms & Testing files (ipynb)
1. example_models
2. example_testing

### Document
1. dyn_A.dat: record parameters of operating points (BUS g1~g20, BUS 1011/1012/1013/1014, BUS 1021/1022, .....);
2. setting1.dat: only remember to add 
```shell
$CALL_GP F;
```
(negative to show Gnuplot) into it if you want to speedup the simulation;

3. short\_trip_branch.dst: default breaker: g12; default end time: 240.0 sec;
4. temp_display.plt: Gnuplot's parameters.

### Data: Nominal Power from dyn_A.dat
| Generator | Nominal Power (MW)|
|-----------|-------------------|
| g1        | 760.0             |
| g2        | 570.0             |
| g3        | 665.0             |
| g4        | 570.0             |
| g5        | 237.5             |
| **g6**    | **360.0**         |
| **g7**    | **180.0**         |
| g8        | 807.5             |
| g9        | 950.0             |
| g10       | 760.0             |
| g11       | 285.0             |
| g12       | 332.5             |
| g13       | 0.0               |
| **g14**   | **630.0**         |
| **g15**   | **1080.0**        |
| **g16**   | **630.0**         |
| g17       | 540.0             |
| g18       | 1080.0            |
| g19       | 475.0             |
| g20       | 4275.0            |
