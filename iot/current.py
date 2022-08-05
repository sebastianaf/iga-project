import os
import time
import math
import ADS1x15
from dbInsert import insert
from environment import setEnvironment

analogInput = 0
factor = 53

ADS = ADS1x15.ADS1015(1)
ADS.setGain(ADS.PGA_1_024V)

setEnvironment()

def getRMS(values):
    i_peak = max(values)
    return i_peak/(math.sqrt(2))

def run():
    try:
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
        print("%.2f" % (value)) #Amperes
        insert(value,2)
        time.sleep(1)
    except Exception as error:
        print(error)
        time.sleep(2)
    

while True:
    run()
    