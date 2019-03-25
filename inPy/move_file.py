import os
import shutil


    def move_file(flag, kp, ki, td):
      '''
      Move cur file:
      '''
      
      # Open, read and re-write contents to another file (in public folder) (cur)
      with open("temp_display.cur") as f00:
        with open("temp_display_.cur", "w") as f01:
          for line in f00:
            if "error" not in line:
              f01.write(line)
      print("re-write cur successfully")

      # Copy the file (in public folder) to another prepared folder (cur)
      shutil.copy("temp_display_.cur", r'D:\OneDrive - University of Leeds\Nordic\td_' + str(td) + 'ms')
      print("copy cur successfully")

      # Rename the file in new folder (cur)
      os.rename(r'D:\OneDrive - University of Leeds\Nordic\td_' + str(td) + 'ms' + '\temp_display_.cur', 
            r'D:\OneDrive - University of Leeds\Nordic\td_' + str(td) + 'ms' + '\temp_display_' + str(kp) + '-' + str(ki) + '-' + str(td) + 's' + '.cur')
      print("rename cur successfully")

      '''
      Delete cur & trace files:
      '''
      
      # Delete cur files in public folder
      os.unlink("temp_display.cur")
      os.unlink("temp_display_.cur")
      print("delete temp_display(_).cur successfully")

      # Delete trace: cont, disc, init, output
      os.unlink("cont.trace")
      os.unlink("disc.trace")
      os.unlink("init.trace")
      os.unlink("output.trace")
      print("delete trace: cont, disc, init, output successfully\n")