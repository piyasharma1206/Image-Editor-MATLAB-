function func_r(objhandler,event)
rgb=getimage(gca);       

    if size(rgb,3) ~= 3 
    rgb= cat(3, rgb, rgb, rgb);
    end
          sliderValue=get(objhandler,'Value');
          set(objhandler,'value',sliderValue);
          myimage=imadjust(rgb,[sliderValue 0 0; 1 1 1],[]);
          cla;
          subplot(1,1,1);
          imshow(myimage);

 
end

