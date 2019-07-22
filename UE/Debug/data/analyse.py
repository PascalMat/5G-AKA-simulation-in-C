
#Read file
fobj = open("ue.txt")
modules = ["SEAF: Nseaf","AUSF: Nausf","UDM: Nudm_UE"]
import numpy as np
timestr = ["Tin","Tout"]
beginstr = "Begin"
endstr = "End"
elements = list()
timeSelect = 0
start = 0
end = 0
time = 0
times = list() # SEAF,AUSF,UDM
timeSEAF = list()
timeAUSF = list()
timeUDM = list()
for l in fobj:
    for item in timestr:
        if(l.find(item,0, len(l))>=0):
            #print(l)
            if(l.find(timestr[0],0, len(l))>=0):
                #Tin
                t = l.split()
                start = int(t[1])
            if(l.find(timestr[1],0, len(l))>=0):
                #Tin
                t = l.split()
                end = int(t[1])
                time += (int)(end/1000 - start/1000)
            elements.append(l)
    if(l.find("UE Exit",0, len(l))>=0):    
        times.append(time)
        time = 0
                
fobj.close()

print(len(times))
print("UE")
print(min(times))
print(max(times))
print(sum(times)/len(times))

ttt= np.array(times)
print(ttt.std())
