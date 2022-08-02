import os
import time
import math
import ADS1x15

vcc = 5
analogInput = 0
factor = 101

ADS = ADS1x15.ADS1015(1)
ADS.setGain(ADS.PGA_6_144V)

def getRMS(values):
  v_peak = max(values)
  return v_peak/(2*math.sqrt(2))

while True:
  samplesCounter = 0
  samplesData = []

  while samplesCounter<20:
    digitalValue = ADS.readADC(analogInput)
    voltage = ADS.toVoltage(digitalValue)
    samplesData.append(voltage)
    samplesCounter += 1
    time.sleep(1/1000)

  rms = getRMS(samplesData)
  print("%.2f" % (rms*factor)) #Volts
  time.sleep(1)
