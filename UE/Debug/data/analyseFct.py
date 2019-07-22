import numpy as np
#Read file
fobj = open("ue.txt")
functions = ["calc_HXRESstar",
"kdf",
"genericKeyDerivation",
"f1",
"getSharedSecret",
"f2345",#5
"get_Suci",
"encrypt",
"computeRES",
"autnIsAccepted"]#9
durationstr = "Duration"

meas = list()
durelements = list()
idx = 9
for line in fobj:
    
    l = line.strip()
    #print(l)
    if(l.find(durationstr,0, len(l))>=0):
        tmp = l.strip()
        durelements.append(l)
        anfDur = l.find(durationstr,0, len(l))
        dur = int(tmp[anfDur+9:len(tmp)])
        
        #print(tmp)
        #print(l)
        if(l.find(functions[idx],0, len(l))>=0):
            #print(l)
            meas.append(dur)
    
fobj.close()


print(functions[idx])
print(len(meas))
print(min(meas))
print(max(meas))
print(sum(meas)/len(meas))
ttt= np.array(meas)
print(ttt.std())
ms = "$\mu\mathrm{s}$"
print(functions[idx] + "&" +str(sum(meas)/len(meas))+ms+"&" +str(ttt.std())+ms+"&" +str(min(meas))+ms+"&" +str(max(meas))+ms+"\\")
