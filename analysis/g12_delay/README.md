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
1. Nodric grid without secondary frequency control (sfc):
![](https://i.loli.net/2019/04/22/5cbcd2698e41f.png)
From the figure above, we can start secondary frequency control (sfc) from the 75 sec.

2. Stable points (overshoot <= required limit (Nordic: 1±0.2%) & system ending at 360 sec, the system will be sattled before 240 sec):
![](https://i.loli.net/2019/04/22/5cbce90caa848.png)
p.s. **Reasons do not to require min(f) > 0.998 or max(f) < 1.002 after the control starts** (Nordic frequency limit: 1±0.2%):
- The shape of the frequency-time curve will be controlled if we limit the range of overshoot & the sattling time. In other word, the system will not be unstable if not add min(f) > 0.998 or max(f) < 1.002;
- Not having min(f) > 0.998 may produce frequency below 0.998 after the sfc starts, but:
  1. Appears in a short period of time after sfc control. It can be considered as the product of the excessive phase of pfc (primary frequency control) and sfc;
  2. One of the reasons why the frequency has a chance of less than 0.998 is that the frequency is very close to 0.998 when the sfc starts;
  3. Another reason is that kp is too large, for instanse, kp = 230.10 & ki = 10.10. However, in reality, we might not use a very large kp like this. A larger kp will introduce a faster control. Thus, a large kp will introduce a large demand of power output and the demand of power output might be exceed the nominal power of a generator ([g8_emergency_control - 5.](https://github.com/realgjl/sfcNordic/tree/master/analysis/g8_emergency_control));
  4. The purpose of the analysis is to find out the impact of delays on sfc and the grid system;
  5. The [MATLAB program](https://github.com/realgjl/sfcNordic/blob/master/analysis/g12_delay/i_cur_plot.m) will be nearly 300 times slower (6000 more mins) than the program not adding min(f) > 0.998 or max(f) < 1.002.
