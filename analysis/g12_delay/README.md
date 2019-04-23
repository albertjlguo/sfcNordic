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

Some of the stable points ranked by SETTLINGTIME:

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

Some of the stable points ranked by SETTLINGTIME:

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

**From the three plots above, it is can be concluded that a larger delay will make kp & ki more and more concentrated. Besides, obviously, a larger delay will remove some larger kps and/or some larger kis.**

**Thus, find the boundary is far from enough. It is necessary to make sure which kp and ki will bring the best (fastest) results for all the delays situation.**

**Even though the object of this project is not really to find the best ONE, it's worth to find the one in my searching spaces.**

5. The best groups of kp & ki for different delays.

| kp   | ki  | delay | settling time |
|------|-----|-------|---------------|
| 55.1 | 0.1 | 0.01  | 35.8142       |
| 55.1 | 0.1 | 0.02  | 35.8292       |
| 55.1 | 0.1 | 0.03  | 35.8392       |
| 55.1 | 0.1 | 0.04  | 35.8392       |
| 55.1 | 0.1 | 0.05  | 35.8492       |
| 50.1 | 0.1 | 0.06  | 36.7849       |
| 50.1 | 0.1 | 0.07  | 36.7816       |
| 50.1 | 0.1 | 0.08  | 36.7716       |
| 50.1 | 0.1 | 0.09  | 36.7683       |
| 50.1 | 0.1 | 0.1   | 36.7516       |
| 50.1 | 0.1 | 0.11  | 36.7464       |
| 50.1 | 0.1 | 0.12  | 36.7264       |
| 45.1 | 0.1 | 0.13  | 37.7064       |
| 45.1 | 0.1 | 0.14  | 37.6708       |
| 45.1 | 0.1 | 0.15  | 37.6564       |
| 45.1 | 0.1 | 0.16  | 37.6108       |
| 45.1 | 0.1 | 0.17  | 37.5808       |
| 45.1 | 0.1 | 0.18  | 37.4908       |
| 45.1 | 0.1 | 0.19  | 37.4408       |
| 40.1 | 0.1 | 0.2   | 38.7264       |
| 40.1 | 0.1 | 0.21  | 38.6808       |


The best groups of kp & ki of all delays (average) (Top 10).

|   kp   |   ki    | Average Settling Time (sec) |
|--------|---------|-----------------------------|
|**45.1**| **0.1** | **37.9994**                 |
| 50.1   | 0.1     | 38.413                      |
| 40.1   | 0.1     | 38.9001                     |
| 55.1   | 0.1     | 38.9327                     |
| 60.1   | 0.1     | 39.3549                     |
| 65.1   | 0.1     | 39.5537                     |
| 70.1   | 0.1     | 40.2168                     |
| 35.1   | 0.1     | 40.4876                     |
| 75.1   | 0.1     | 41.0838                     |
| 80.1   | 0.1     | 41.3066                     |
