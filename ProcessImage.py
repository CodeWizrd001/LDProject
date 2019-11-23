from PIL import Image
import sys

imname = sys.argv[1]

im = Image.open(imname+'.jpg', 'r')
width, height = im.size
pixel_values = list(im.getdata())
a = [0 for i in range(1024)]
for i in range(len(pixel_values)) :
    a[i] = int(sum(pixel_values[i])/3)
    if a[i] > 128 :
        a[i] = 0
    else :
        a[i] = 1

f = open(imname+'.txt',"w")
f.write(''.join(str(i) for i in a))
f.close()

print(imname+'.jpg')