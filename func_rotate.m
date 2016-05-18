function func_rotate(objh,event)
rgb=getimage(gca);
if size(rgb,3) ~= 3 
    rgb= cat(3, rgb, rgb, rgb);
end
myimage=imrotate(rgb,90);
subplot(1,1,1);
imshow(myimage);
end