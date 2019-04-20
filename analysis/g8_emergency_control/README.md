### Data: Nominal Power from [dyn_A.dat](https://github.com/realgjl/sfcNordic/blob/master/examples/dyn_A.dat) (SYNC_MACH)
| Generator | Nominal Power (MW)| Nominal Power (MW) (g8)| the transformer that generator is connected to (TRFO) |
|-----------|-------------------|------------------------|-------------------------------------------------------|
| g1        | 760.0             |                        |                                                       |
| g2        | 570.0             |                        |                                                       |
| g3        | 665.0             |                        |                                                       |
| g4        | 570.0             |                        |                                                       |
| g5        | 237.5             |                        |                                                       |
| **g6**    | **360.0** (1/8)   | **468.0**  (1/8)       | **g6-1042**                                           |
| **g7**    | **180.0** (1/16)  | **234.0**  (1/16)      | **g7-1043**                                           |
| g8        | 807.5             |                        |                                                       |
| g9        | 950.0             |                        |                                                       |
| g10       | 760.0             |                        |                                                       |
| g11       | 285.0             |                        |                                                       |
| g12       | 332.5             |                        |                                                       |
| g13       | 0.0               |                        |                                                       |
| **g14**   | **630.0** (7/32)  | **819.0**  (7/32)      | **g14-4042**                                          |
| **g15**   | **1080.0** (3/8)  | **1404.0**  (3/8)      | **g15-4047**                                          |
| **g16**   | **630.0** (7/32)  | **819.0**  (7/32)      | **g16-4051**                                          |
| g17       | 540.0             | 640.0                  |                                                       |
| g18       | 1080.0            |                        |                                                       |
| g19       | 475.0             |                        |                                                       |
| g20       | 4275.0            |                        |                                                       |

1. **kp = 0, ki = 0, delay = 0.01s, diconnect g8: the system will blacked out**:
![](https://i.loli.net/2019/04/19/5cb9e45407eab.png)

2. **Statring the control at t = 15 sec, the system can be sattled at t = 24.9354s**:
![](https://i.loli.net/2019/04/19/5cb9e5773523b.png)

3. However, it's might be too fast for the generators. We need to make sure the five generators have enough power to handle the situation.
Thus, we must find power-time relationship of the five generators.
