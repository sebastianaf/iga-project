import RPi.GPIO as GPIO
import time, sys
from dbInsert import insert
from environment import setEnvironment

FLOW_SENSOR_GPIO = 21
global count
count = 0
factor = 3.642369
setEnvironment()

GPIO.setmode(GPIO.BCM)
GPIO.setup(FLOW_SENSOR_GPIO, GPIO.IN, pull_up_down = GPIO.PUD_UP)
GPIO.add_event_detect(FLOW_SENSOR_GPIO, GPIO.FALLING, callback=countPulse)

def countPulse(channel):
   global count
   if start_counter == 1:
      count = count+1

while True:
    try:
        start_counter = 1
        time.sleep(0.5)
        start_counter = 0
        flow = (count / factor)
        count = 0
        print("%.2f" % (flow)) #lts/min
        insert(flow,1)
        time.sleep(0.5)
    except KeyboardInterrupt:
        print('\nkeyboard interrupt!')
        GPIO.cleanup()
        sys.exit()

