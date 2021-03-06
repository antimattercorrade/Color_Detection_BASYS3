#! /usr/bin/python
# Imported Standard Modules
import sys
from PIL import Image 




def Convert (ImageName):
	"""
		This converts the given image into a Xilinx Coefficients (.coe) file.
		Pass it the name of the image including the file suffix.
		The file must reside in the directory from which this function is called
		or provide the absolute path. 
	"""
	# Open image
	img 	= Image.open(ImageName)
	# Verify that the image is in the 'RGB' mode, every pixel is described by 
	# three bytes
	if img.mode != 'RGB':
		img = img.convert('RGB')

	# Store Width and height of image
	width 	= img.size[0]
	height	= img.size[1]

	# Create a .coe file and open it.
	# Write the header to the file, where lines that start with ';' 
	# are commented
	filetype = ImageName[ImageName.find('.'):]
	filename = ImageName.replace(filetype,'.coe')
	imgcoe	= open(filename,'wb')
	b=bytes(';	VGA Memory Map\n',encoding='utf-8')
	imgcoe.write(b)
	b=bytes('; .COE file with hex coefficients\n',encoding='utf-8')
	imgcoe.write(b)
	b=bytes('; Height: {0}, Width: {1}\n'.format(height,width),encoding='utf-8')
	imgcoe.write(b)
	b=bytes('memory_initialization_radix = 16;\n',encoding='utf-8')
	imgcoe.write(b)
	b=bytes('memory_initialization_vector =\n',encoding='utf-8')
	imgcoe.write(b)
	
	# Iterate through every pixel, retain the 3 least significant bits for the
	# red and green bytes and the 2 least significant bits for the blue byte. 
	# These are then combined into one byte and their hex equivalent is written
	# to the .coe file
	cnt = 0
	line_cnt = 0
	for r in range(0, height):
		for c in range(0, width):
			cnt += 1
			# Check for IndexError, usually occurs if the script is trying to 
			# access an element that does not exist
			try:
				R,G,B = img.getpixel((c,r))
			except IndexError:
				print('Index Error Occurred At:')
				print('c: {}, r:{}'.format(c,r))
				sys.exit()
			# convert the value (0-255) to a binary string by cutting off the 
			# '0b' part and left filling zeros until the string represents 8 bits
			# then slice off the bits of interest with [5:] for red and green
			# or [6:] for blue
			Rb = bin(R)[2:].zfill(8)[:3]
			Gb = bin(G)[2:].zfill(8)[:3]
			Bb = bin(B)[2:].zfill(8)[:2]
			
			Outbyte = Rb+Gb+Bb
			# Check for Value Error, happened when the case of the pixel being 
			# zero was not handled properly	
			try:
				b = bytes('%2.2X'%int(Outbyte,2),encoding='utf-8')
				imgcoe.write(b)
			except ValueError:
				print('Value Error Occurred At:')
				print('Contents of Outbyte: {0} at r:{1} c:{2}'.format(Outbyte,r,c))
				print('R:{0} G:{1} B{2}'.format(R,G,B))
				print('Rb:{0} Gb:{1} Bb:{2}'.format(Rb,Gb,Bb))
				sys.exit()
			# Write correct punctuation depending on line end, byte end,
			# or file end
			if c==width-1 and r==height-1:
				b=bytes(';',encoding='utf-8')
				imgcoe.write(b)
			else:
				if cnt%32 == 0:
					b=bytes(',\n',encoding='utf-8')
					imgcoe.write(b)
					line_cnt+=1
				else:
					b=bytes(',',encoding='utf-8')
					imgcoe.write(b)
	imgcoe.close()
	print('Xilinx Coefficients File:{} DONE'.format(filename))
	print('Converted from {} to .coe'.format(filetype))
	print('Size: h:{} pixels w:{} pixels'.format(height,width))
	print('COE file is 32 bits wide and {} bits deep'.format(line_cnt))
	print('Total addresses: {}'.format(32*(line_cnt+1)))



if __name__ == '__main__':
	ImageName = input('Enter the name of your image: ')
	Convert(ImageName)
