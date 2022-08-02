import RPi.GPIO as GPIO
import time, sys
from dbInsert import insert

FLOW_SENSOR_GPIO = 21
global count
count = 0
factor = 0.849399

GPIO.setmode(GPIO.BCM)
GPIO.setup(FLOW_SENSOR_GPIO, GPIO.IN, pull_up_down = GPIO.PUD_UP)

def countPulse(channel):
   global count
   if start_counter == 1:
      count = count+1

GPIO.add_event_detect(FLOW_SENSOR_GPIO, GPIO.FALLING, callback=countPulse)

while True:
    try:
        start_counter = 1
        time.sleep(0.5)
        start_counter = 0
        flow = (count / factor)
        #print("%.2f" % (flow)) #lts/min
        count = 0
        time.sleep(0.5)
        insert(flow,1)
    except KeyboardInterrupt:
        print('\nkeyboard interrupt!')
        GPIO.cleanup()
        sys.exit()

