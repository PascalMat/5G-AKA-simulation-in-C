import numpy as np
#Read file
fobj = open("seaf.txt")
modules = ["SEAF: Nseaf","AUSF: Nausf","UDM: Nudm_UE"]
timestr = ["Tin","Tout"]
beginstr = "Begin"
endstr = "End"
elements = list()
timeSelect = 0
start = 0
end = 0
times = [0,0,0] # SEAF,AUSF,UDM
timeSEAF = list()
timeAUSF = list()
timeUDM = list()
for line in fobj:
    
    l = line.strip()
    for m in modules:
        if(l.find(m,0, len(l))>=0):
            elements.append(l)
            if(l.find(beginstr,0, len(l))>=0):
                if(m==modules[0]):
                    timeSelect=0
                if(m==modules[1]):
                    timeSelect=1
                if(m==modules[2]):
                    timeSelect=2
            if(l.find(endstr,0, len(l))>=0):
                timeSelect -= 1
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
                times[timeSelect] += (int)(end/1000 - start/1000)
            elements.append(l)
    if(l.find("Authentication End",0, len(l))>=0):    
        timeSEAF.append(times[0])
        timeAUSF.append(times[1])
        timeUDM.append(times[2])
        times =[0,0,0]
                
fobj.close()

print(len(timeSEAF))
print("SEAF")
print(min(timeSEAF))
print(max(timeSEAF))
print(sum(timeSEAF)/len(timeSEAF))
ttt= np.array(timeSEAF)
print(ttt.std())

print("AUSF")
print(min(timeAUSF))
print(max(timeAUSF))
print(sum(timeAUSF)/len(timeAUSF))
ttt= np.array(timeAUSF)
print(ttt.std())

print("UDM")
print(min(timeUDM))
print(max(timeUDM))
print(sum(timeUDM)/len(timeUDM))
ttt= np.array(timeUDM)
print(ttt.std())
