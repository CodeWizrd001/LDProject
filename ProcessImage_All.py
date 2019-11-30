from PIL import Image
import sys
import os

p = os.getcwd()+"\\Inputs"

inputs = []

for r,d,files in os.walk(p) :
    for imname in files :
        im = Image.open("Inputs/"+imname, 'r')
        width, height = im.size
        pixel_values = list(im.getdata())
        a = [0 for i in range(1024*3)]
        for i in range(len(pixel_values)) :
            a[i] = int(sum(pixel_values[i])/3)
            if a[i] > 128 :
                a[i] = 0
            else :
                a[i] = 1
        inputs.append(''.join(str(i) for i in a))

pInputs = []

for j in inputs :
    a = [[],[],[]]
    k = 0
    for i in range(len(j)) :
        a[k].append(j[i])
        if(i%32==31) :
            k += 1
            k %= 3
    pInputs.append(''.join(str(p) for p in a[0])+''.join(str(q) for q in a[1])+''.join(str(r) for r in a[2]))
    
f = open('Inputs_.txt',"w")
for a in pInputs :
    f.write(''.join(str(i) for i in a)+"\n")
f.close()

def MatPrint96x32(new) :
    for i in range(96*32) :
        print(new[i],end=" ")
        if i%96 == 95 :
            print("")

def MatPrint32x32(new) :
    flag =0
    for i in range(32*32) :
        if i%2 == 0 and flag%2 == 0 :
            print(new[i],end=" ")
        if i%32 == 31 :
            flag += 1
            if flag%2 :
                print("")

print('Done Processing')
