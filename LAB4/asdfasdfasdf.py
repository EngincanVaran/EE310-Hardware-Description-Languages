from PIL import Image
import numpy as np

imsize = 256


def txt_to_img(l):
	pictureName = l
	pictureFile = pictureName + ".txt"
	picturePNG = pictureName + "_r.png"

	# Read data from txt 
	with open(pictureFile, 'r') as f:
	    pixels = f.read().splitlines()

	# Convert string pixels to int
	for i,x in enumerate(pixels):
	    pixels[i] = int(x,2)

	# Convert the pixels into an array using numpy
	array = np.array(pixels, dtype=np.uint8)

	# Convert array into 8-bit 256x256 graysacle image
	image_out = Image.new('L',(imsize,imsize))
	image_out.putdata(array)

	# Save the image
	image_out.save(picturePNG)


l = ["baboon", "lena", "egg", "puppy","cameraman"]

for x in l:
	txt_to_img(x)