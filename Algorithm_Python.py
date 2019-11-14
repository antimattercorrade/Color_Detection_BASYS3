
from PIL import Image
import datetime

start_time = datetime.datetime.now()
img = Image.open('Final_test.png')
px1 = img.load()
px = {}
for i in range(img.height):
    for j in range(img.width):
        px[j,i] = px1[j,i]


def f(px,j,i):
    return int(bin(px[j,i][0])[2:].zfill(8)[:3] + bin(px[j,i][1])[2:].zfill(8)[:3] + bin(px[j,i][2])[2:].zfill(8)[:2],2)

colours = {224:['red',0],0:['black',0],28:['green',0],252:['yellow',0],3:['blue',0]}


def make_white(px,top_most,r):
    colours[f(px,top_most[0],top_most[1])][1] = colours[f(px,top_most[0],top_most[1])][1] + 1
    j,i = top_most[0]-r,top_most[1]
    while(i <= top_most[1] + 2*r):
        j = top_most[0]-r
        while(j <= top_most[0] + r):
            px[j,i] = (255,255,255)
            j += 1
        i += 1


top_most = 0
i,j=0,0
while( i < img.height):
    j = 0
    while(j < img.width):
        val = int(bin(px[j,i][0])[2:].zfill(8)[:3] + bin(px[j,i][1])[2:].zfill(8)[:3] + bin(px[j,i][2])[2:].zfill(8)[:2],2)
        cur_pixel = val
        if val in colours.keys():
            r = 1
            top_most = (j,i)
            # print(top_most)
            # print(px[top_most[0],top_most[1]])
            # print(px[top_most[0]+2,top_most[1]+2])
            while(cur_pixel == val):
                cur_pixel = f(px,j+r,i+r)
                # print(cur_pixel)
                # print(val)
                r += 1
            # print(r)
            # exit()
            make_white(px,top_most,r)
        j += 1
    i += 1
print(colours)
s = set()
for i in range(img.height):
    for j in range(img.width):
        s.add(px[j,i])

end_time = datetime.datetime.now()
c = end_time - start_time
print("{}:{}".format(c.seconds,c.microseconds))
print(r)
#print(s)





