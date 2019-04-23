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


### Results
### Results
1. Nodric grid without secondary frequency control (sfc):
![](https://i.loli.net/2019/04/22/5cbcd2698e41f.png)

2. Searching spaces: kp: 0.1~325.1, step: 5.0; ki: 0.1~25.1, step: 5.0; delay: 0.01s~0.21s, step: 0.01s.

3. Stable points (overshoot <= required limit (Nordic: 1±0.2%) & system sattled before endingTime (240s))
[![Screen Shot 2019-04-18 at 14.28.11.png](https://i.loli.net/2019/04/18/5cb87fb03733d.png)](https://i.loli.net/2019/04/18/5cb87fb03733d.png)

3. 
