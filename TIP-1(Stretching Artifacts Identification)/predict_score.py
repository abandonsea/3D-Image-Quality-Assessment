from keras.models import load_model
import cv2
import numpy as np

M, N = 160, 160

basic_cnn = load_model('vgg_final_160.h5')

image = cv2.imread("img_1.png")
    
tiles = [image[x:x+M, y:y+N] for x in range(0, image.shape[0], M) for y in range(0, image.shape[1], N)]
	
img_tile = np.array(tiles)
    
img_tile_scaled = img_tile.astype('float32')
    
img_tile_scaled /= 255
result = basic_cnn.predict_classes(img_tile_scaled, verbose=0)
    
score_img = ((np.count_nonzero(result==0)/(img_tile.shape[0]))*100)