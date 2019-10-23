colours = {224:'red',34:'blue',57:'green'}
s = []
from PIL import Image
img = Image.open('image2.png')
px = img.load()
s1 = set()
for i in range(img.height):
    for j in range(img.width):
        s1.add(px[j,i])
        # if(px[j,i][1] == 68 and px[j,i][2] == 54):
            # print(px[j,i])
        val = int(bin(px[j,i][0])[2:][:3] + bin(px[j,i][1])[2:][:3] + bin(px[j,i][2])[2:][:2],2)
        # if val in colours.keys():
        s.append(val)
print(set(s))



