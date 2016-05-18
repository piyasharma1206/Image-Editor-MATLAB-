function func_grayScale(object_handle,event)
rgb =  getimage(gca);
grayImage = 0.2989 * rgb(:,:,1) + 0.5870 * rgb(:,:,2) + 0.1140 * rgb(:,:,3); 
cla;
subplot(1,1,1);
imshow(grayImage);
end