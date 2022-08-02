import Adafruit_DHT
import time

sensor = Adafruit_DHT.DHT11
pin = 20

while True:
  hum, temp = Adafruit_DHT.read_retry(sensor, pin)
  print("%.2f" % (temp)) #ºC
  time.sleep(1)
