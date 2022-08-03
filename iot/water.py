import RPi.GPIO as GPIO
import time, sys
from dbInsert import insert
from environment import setEnvironment

FLOW_SENSOR_GPIO = 21
count = 0
factor = 3.642369
setEnvironment()

GPIO.setmode(GPIO.BCM)
GPIO.setup(FLOW_SENSOR_GPIO, GPIO.IN, pull_up_down = GPIO.PUD_UP)

def countPulse(channel):
   global count
   if start_counter == 1:
      count = count+1

GPIO.add_event_detect(FLOW_SENSOR_GPIO, GPIO.FALLING, callback=countPulse)

def run():
    try:
        start_counter = 1
        time.sleep(0.5)
        start_counter = 0
        global count
        flow = (count / factor)
        print("%.2f" % (flow)) #lts/min
        count = 0
        insert(flow,1)
        time.sleep(0.5)
    except KeyboardInterrupt:
        print('\nkeyboard interrupt!')
        GPIO.cleanup()
        sys.exit()


while True:
    run()

