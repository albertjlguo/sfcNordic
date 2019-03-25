<<<<<<< HEAD
<<<<<<< HEAD
import os
import shutil
import numpy as np
import PyRAMSES
from end_simulation import end_simulation
from move_file import move_file
from sfc import sfc
from agc import agc


if __name__ == '__main__':
    '''
    tuning kp & ki:
    '''

    for td in np.arange(0.01, 0.22, 0.10):  # td: 0.010 sec, 0.110, 0.210
        td = "{0:.2f}".format(round(td,2))
        for kp in np.arange(0.1, 50.1, 10.0):  # kp: 0.1-50.1 (#1)

            '''
            define relationship between kp and ki
            '''
            if float(kp)>=0.1 and float(kp)<=49.6:  # kp: 0.1-49.6
                coef = 0.6341
                pass

            if float(kp)>=50.1 and float(kp)<=99.6:  # kp: 50.1-99.6
                coef = 0.5709
                pass

            if float(kp)>=100.1 and float(kp)<=149.6:  # kp: 100.1-149.6
                coef = 0.5355
                pass

            if float(kp)>=150.1 and float(kp)<=199.6:  # kp: 150.1-199.6
                coef = 0.4837
                pass

            if float(kp)>=200.1 and float(kp)<=249.6:  # kp: 200.1-249.6
                coef = 0.4153
                pass

            if float(kp)>=250.1 and float(kp)<=299.6:  # kp: 250.1-299.6
                coef = 0.3583
                pass

            if float(kp)>=300.1 and float(kp)<=349.6:  # kp: 300.1-349.6
                coef = 0.2919
                pass

            if float(kp)>=350.1 and float(kp)<=399.6:  # kp: 350.1-399.6
                coef = 0.2288
                pass

            if float(kp)>=400.1 and float(kp)<=449.6:  # kp: 400.1-449.6
                coef = 0.1602
                pass

            if float(kp)>=450.1 and float(kp)<=499.6:  # kp: 450.1-499.6
                coef = 0.1602
                pass

            if float(kp)>=500.1 and float(kp)<=539.6:  # kp: 500.1-539.6
                coef = 0.0432
                pass

            '''
            ki loop
            '''
            kp = "{0:.2f}".format(round(float(kp),2))
            for ki in np.arange(0.1, coef*float(kp), 10.0):  # ki: 0.1-coef*kp
                ki = "{0:.2f}".format(round(float(ki),2))

                print("kp = " + str(kp))
                print("ki = " + str(ki))
                print("td = " + str(td))

                '''
                Run sfc:
                '''
                sfc(kp, ki, td)
                pass

=======
import os
import shutil
import numpy as np
import PyRAMSES
from end_simulation import end_simulation
from move_file import move_file
from sfc import sfc
from agc import agc


if __name__ == '__main__':
    '''
    tuning kp & ki:
    '''

    for td in np.arange(0.01, 0.02, 0.02):  # td: 0.010 sec
        td = "{0:.2f}".format(round(td,2))
        for kp in np.arange(276.6, 299.7, 0.5):  # kp: 276.1-299.6 (pa3)

            '''
            define relationship between kp and ki
            '''
            if float(kp)>=0.1 and float(kp)<=49.6:  # kp: 0.1-49.6
                coef = 0.6341
                pass

            if float(kp)>=50.6 and float(kp)<=99.6:  # kp: 50.6-99.6
                coef = 0.5709
                pass

            if float(kp)>=100.6 and float(kp)<=149.6:  # kp: 100.6-149.6
                coef = 0.5355
                pass

            if float(kp)>=150.6 and float(kp)<=199.6:  # kp: 150.6-199.6
                coef = 0.4837
                pass

            if float(kp)>=200.6 and float(kp)<=249.6:  # kp: 200.6-249.6
                coef = 0.4153
                pass

            if float(kp)>=250.6 and float(kp)<=299.6:  # kp: 250.6-299.6
                coef = 0.3583
                pass

            if float(kp)>=300.6 and float(kp)<=349.6:  # kp: 300.6-349.6
                coef = 0.2919
                pass

            if float(kp)>=350.6 and float(kp)<=399.6:  # kp: 350.6-399.6
                coef = 0.2288
                pass

            if float(kp)>=400.6 and float(kp)<=449.6:  # kp: 400.6-449.6
                coef = 0.1602
                pass

            if float(kp)>=450.6 and float(kp)<=499.6:  # kp: 450.6-499.6
                coef = 0.1602
                pass

            if float(kp)>=500.6 and float(kp)<=499.6:  # kp: 450.6-539.6
                coef = 0.0432
                pass

            '''
            ki loop
            '''
            kp = "{0:.2f}".format(round(float(kp),2))
            for ki in np.arange(0.1, coef*float(kp), 0.5):  # ki: 0.1-coef*kp
                ki = "{0:.2f}".format(round(float(ki),2))

                print("kp = " + str(kp))
                print("ki = " + str(ki))
                print("td = " + str(td))

                '''
                Run sfc:
                '''
                sfc(kp, ki, td)
                pass

>>>>>>> cfe4cb85f7f9c6c325b00a1ad73736ccb546c7b3
=======
import os
import shutil
import numpy as np
import PyRAMSES
from end_simulation import end_simulation
from move_file import move_file
from sfc import sfc
from agc import agc


if __name__ == '__main__':
    '''
    tuning kp & ki:
    '''

    for td in np.arange(0.01, 0.02, 0.02):  # td: 0.010 sec
        td = "{0:.2f}".format(round(td,2))
        for kp in np.arange(276.6, 299.7, 0.5):  # kp: 276.1-299.6 (pa3)

            '''
            define relationship between kp and ki
            '''
            if float(kp)>=0.1 and float(kp)<=49.6:  # kp: 0.1-49.6
                coef = 0.6341
                pass

            if float(kp)>=50.6 and float(kp)<=99.6:  # kp: 50.6-99.6
                coef = 0.5709
                pass

            if float(kp)>=100.6 and float(kp)<=149.6:  # kp: 100.6-149.6
                coef = 0.5355
                pass

            if float(kp)>=150.6 and float(kp)<=199.6:  # kp: 150.6-199.6
                coef = 0.4837
                pass

            if float(kp)>=200.6 and float(kp)<=249.6:  # kp: 200.6-249.6
                coef = 0.4153
                pass

            if float(kp)>=250.6 and float(kp)<=299.6:  # kp: 250.6-299.6
                coef = 0.3583
                pass

            if float(kp)>=300.6 and float(kp)<=349.6:  # kp: 300.6-349.6
                coef = 0.2919
                pass

            if float(kp)>=350.6 and float(kp)<=399.6:  # kp: 350.6-399.6
                coef = 0.2288
                pass

            if float(kp)>=400.6 and float(kp)<=449.6:  # kp: 400.6-449.6
                coef = 0.1602
                pass

            if float(kp)>=450.6 and float(kp)<=499.6:  # kp: 450.6-499.6
                coef = 0.1602
                pass

            if float(kp)>=500.6 and float(kp)<=499.6:  # kp: 450.6-539.6
                coef = 0.0432
                pass

            '''
            ki loop
            '''
            kp = "{0:.2f}".format(round(float(kp),2))
            for ki in np.arange(0.1, coef*float(kp), 0.5):  # ki: 0.1-coef*kp
                ki = "{0:.2f}".format(round(float(ki),2))

                print("kp = " + str(kp))
                print("ki = " + str(ki))
                print("td = " + str(td))

                '''
                Run sfc:
                '''
                sfc(kp, ki, td)
                pass

>>>>>>> cfe4cb85f7f9c6c325b00a1ad73736ccb546c7b3
            pass