from PIL import Image 

def Mat32x32(l) :
    for i in range(1024) :
        print(l[i],end=" ")
        if i%32 == 31 :
            print("")

alph = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
nums = [i for i in range(1,11)]

pixelArray = []

for p in alph :
    for n in nums :
        im = Image.open(p+'_'+str(n)+'.jpg', 'r')
        width, height = im.size
        pixel_values = list(im.getdata())
        a = [0 for i in range(1024)]
        for i in range(len(pixel_values)) :
            a[i] = int(sum(pixel_values[i])/3)
            if a[i] > 128 :
                a[i] = 0
            else :
                a[i] = 1
        pixelArray.append(a)
        print("Processed : "+p+'_'+str(n)+'.jpg')

def toString(l) :
    return ''.join(str(j) for j in l)

def WriteToFile() :
    pixelArrayFile = open("pixelArrayFile.txt","w")
    for i in pixelArray :
        pixelArrayFile.write("Sample["+str(pixelArray.index(i))+"] = 1024'b"+toString(i)+" ;\n")
    pixelArrayFile.close()
