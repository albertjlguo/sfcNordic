### Useful files/folders
1. .../ipynb->py/
2. Nordic_example_testing1.ipynb
3. Nordic_example_testing2_communicationLink.ipynb
4. Nordic_example_tuning1.ipynb
5. Nordic_example_tuning2_communicationLink.ipynb
6. README.md
7. cmd.txt
8. dyn_A.dat
9. examples_models.py
10. obs.dat
11. setting1.dat
12. short\_trip_branch.dst
13. temp_display.plt
14. volt\_rat_A.dat

### Suggestions and Tips
1. "\_testing\_" means you can change kp, ki, td in one specific value, for example
```python
kp = 50.1
ki = 0.1
td = 0.01
```
"\_tuning\_" means you can change kp, ki, td in a range, for example
```python
for td in np.arange(0.01, 0.04, 0.01);
  for kp in np.arange(0.1, 30.2, 10.0):
    for ki in np.arange(0.1, 0.2, 0.5):
```
means you can tune time delay to 0.01, 0.02, and 0.03, tune kp from 0.1 to 30.1 (step: 10), tune ki to 0.1.


2. We have specific **generators** (you can manually change them) to generate power to retore the frequency of the grid.
You can change the **specific generator(s)** via `list_of_gens`, change the **weight** ($\alpha_n$ in my [post](https://github.com/realgjl/sfcNordic/blob/master/reference%20(pdf)/post.pdf)) via `weight_of_gens`, change the **time delay** (communication delay from this generator to the communication center) via `list_of_td` in the python/Notebook files whhich contains "\_communicationLink"




3. Start from [Nordic_example_testing1.ipynb](https://github.com/realgjl/sfcNordic/blob/master/examples/Nordic_example_testing1.ipynb), change the parameters of the file (kp, ki, td) and find what will happen in gnuplot diagram. (You can uncomment (delete `#`) `$CALL_GP F;` and use MATLAB or Python Matplotlib to draw the the related diagram.)
I have designed many MATLAB programs that contain the content above, for instance, [i_cur_plot.m](https://github.com/realgjl/sfcNordic/blob/master/analysis/5.1/i_cur_plot.m) in "analysis" folder. You only need part of them.












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
