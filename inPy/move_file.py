import os
import shutil

def move_file(flag, kp, ki, td):
  
  folderName = 'td_' + str(td) + 's'
  
  '''
  Create a folder
  '''
  prepared_folder_address = 'D:/OneDrive - University of Leeds/Nordic/Data/' + folderName
  try:
    if not os.path.exists(prepared_folder_address):
      os.makedirs(prepared_folder_address)
  except OSError:
    print('Error: Creating floder:' + prepared_folder_address)
  
  
  '''
  Move cur file:
  '''
  
  # Open, read and re-write contents to another file (in public folder) (cur)
  with open("temp_display.cur", encoding='utf-8') as f00:
    with open("temp_display_.cur", "w", encoding='utf-8') as f01:
      for line in f00:
        if "error" not in line:
          f01.write(line)
  print("re-write cur successfully")

  # Copy the file (in public folder) to another prepared folder
  shutil.copy("temp_display_.cur", prepared_folder_address)
  print("copy cur successfully")

  # Rename the file in new folder (cur)
  os.rename(prepared_folder_address + '/temp_display_.cur', 
        prepared_folder_address + '/temp_display_' + str(kp) + '-' + str(ki) + '-' + str(td) + 's' + '.cur')
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