### Data: Nominal Power from [dyn_A.dat](https://github.com/realgjl/sfcNordic/blob/master/examples/dyn_A.dat) (SYNC_MACH)
| Generator | Nominal Power (MW)|
|-----------|-------------------|
| g1        | 760.0             |
| g2        | 570.0             |
| g3        | 665.0             |
| g4        | 570.0             |
| g5        | 237.5             |
| **g6**    | **360.0** (1/8)   |
| **g7**    | **180.0** (1/16)  |
| g8        | 807.5             |
| g9        | 950.0             |
| g10       | 760.0             |
| g11       | 285.0             |
| g12       | 332.5             |
| g13       | 0.0               |
| **g14**   | **630.0** (7/32)  |
| **g15**   | **1080.0** (3/8)  |
| **g16**   | **630.0** (7/32)  |
| g17       | 540.0             |
| g18       | 1080.0            |
| g19       | 475.0             |
| g20       | 4275.0            |


1. Nodric grid without secondary frequency control (sfc):
![](https://i.loli.net/2019/04/22/5cbcd2698e41f.png)

2. Searching spaces: kp: 0.1-325.1, step: 5.0; ki: 0.1-25.1, step: 5.0; delay: 0.01s~0.21s, step: 0.01s.

3. Stable points (overshoot <= required limit (Nordic: 1±0.2%) & system sattled before endingTime (240s))
[![Screen Shot 2019-04-18 at 14.28.11.png](https://i.loli.net/2019/04/18/5cb87fb03733d.png)](https://i.loli.net/2019/04/18/5cb87fb03733d.png)

4. **Delay = 0.01 sec**

Some of the stable points ranked by SETTLINGTIME:

| KP    | KI   | DELAY | SETTLINGTIME |
|-------|------|-------|--------------|
| 55.1  | 0.1  | 0.01  | 35.8142      |
| 50.1  | 0.1  | 0.01  | 36.78826667  |
| 80.1  | 0.1  | 0.01  | 37.089       |
| 75.1  | 0.1  | 0.01  | 37.65054545  |
| 45.1  | 0.1  | 0.01  | 37.77493333  |
| 70.1  | 0.1  | 0.01  | 37.83971429  |
| 65.1  | 0.1  | 0.01  | 38.33666667  |
| 60.1  | 0.1  | 0.01  | 38.3816      |
| 125.1 | 0.1  | 0.01  | 38.50826667  |
| 120.1 | 0.1  | 0.01  | 38.6642      |


Plot all the stable points (kp & ki):
![](https://i.loli.net/2019/04/24/5cbf498ba71bc.png)


**Delay = 0.11 sec**

All the stable points ranked by SETTLINGTIME:

| KP    | KI   | DELAY | SETTLINGTIME |
|-------|------|-------|--------------|
| 50.1  | 0.1  | 0.11  | 36.7464      |
| 45.1  | 0.1  | 0.11  | 37.7364      |
| 70.1  | 0.1  | 0.11  | 38.70752     |
| 40.1  | 0.1  | 0.11  | 38.9164      |
| 65.1  | 0.1  | 0.11  | 38.95768421  |
| 60.1  | 0.1  | 0.11  | 39.60177778  |
| 55.1  | 0.1  | 0.11  | 39.7828      |
| 105.1 | 0.1  | 0.11  | 40.0444      |
| 35.1  | 0.1  | 0.11  | 40.5808      |
| 100.1 | 0.1  | 0.11  | 40.67493333  |


Plot all the stable points (kp & ki):
![](https://i.loli.net/2019/04/24/5cbf4bf37d93b.png)

**Delay = 0.21 sec**

All the stable points ranked by SETTLINGTIME:

| KP    | KI  | DELAY | SETTLINGTIME |
|-------|-----|-------|--------------|
| 40.1  | 0.1 | 0.21  | 38.6808      |
| 60.1  | 0.1 | 0.21  | 40.03936842  |
| 35.1  | 0.1 | 0.21  | 40.1088      |
| 55.1  | 0.1 | 0.21  | 40.78        |
| 45.1  | 0.1 | 0.21  | 40.9256      |
| 50.1  | 0.1 | 0.21  | 41.01542857  |
| 30.1  | 0.1 | 0.21  | 42.1488      |
| 80.1  | 0.1 | 0.21  | 42.8616      |
| 75.1  | 0.1 | 0.21  | 43.1088      |
| 70.1  | 0.1 | 0.21  | 43.7608      |


Plot all the stable points (kp & ki):
![](https://i.loli.net/2019/04/24/5cbf4cb46b584.png)
