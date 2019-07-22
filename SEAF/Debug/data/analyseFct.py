import numpy as np
#Read file
fobj = open("seaf.txt")
functions = ["decrypt",#0
"derive_Kseaf",
"Nseaf_UEAuthenticationResponse",
"generate_Autn",
"f2345",
"f1",#5
"derive_Kausf",
"calc_XRESstar",
"store_SNName",
"kdf",#
"calc_HXRESstar",#10
"Nausf_UEAuthenticationResponse",
"Nudm_AuthenticationRequest",
"deconcealSuci",
"genericKeyDerivation",
"Nseaf_UEAuthenticationRequest",#15
"Nausf_UEAuthenticationRequest",
"Nudm_AuthenticationSuccessful",
"SharedSecret",
"check_SNName",
"calc_HRESstar"]#20
durationstr = "Duration"

meas = list()
durelements = list()
idx = 20
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
