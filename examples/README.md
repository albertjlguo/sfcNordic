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