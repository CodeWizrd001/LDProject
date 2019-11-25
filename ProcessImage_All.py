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
        a = [0 for i in range(1024)]
        for i in range(len(pixel_values)) :
            a[i] = int(sum(pixel_values[i])/3)
            if a[i] > 128 :
                a[i] = 0
            else :
                a[i] = 1
        inputs.append(''.join(str(i) for i in a))

f = open('Inputs.txt',"w")
for a in inputs :
    f.write(''.join(str(i) for i in a)+"\n")
f.close()

print('Done Processing')
