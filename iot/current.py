
import os
import time
import math
import ADS1x15
import dbInsert

analogInput = 1
factor = 53

ADS = ADS1x15.ADS1015(1)
ADS.setGain(ADS.PGA_1_024V)

def getRMS(values):
    i_peak = max(values)
    return i_peak/(math.sqrt(2))

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
    value = rms*factor
    insert(value,2)
    #print("%.2f" % (value)) #Amperes
    time.sleep(1)