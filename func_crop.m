function func_crop(object_handle,event)
myimage=getimage(gca);

if size(myimage,3) ~= 3 
    myimage= cat(3, myimage, myimage, myimage);
end

kk=waitforbuttonpress;
point1 = get(gca,'CurrentPoint');    % button down detected
finalRect = rbbox;                   % return figure units
point2 = get(gca,'CurrentPoint');    % button up detected
point1 = point1(1,1:2);              % extract x and y
point2 = point2(1,1:2);
p1 = min(point1,point2);             % calculate locations
offset = abs(point1-point2);         % and dimensions
% Find the coordinates of the box.
xCoords = [(p1(1)) (p1(1)+offset(1)) (p1(1)+offset(1)) (p1(1)) (p1(1))];
yCoords = [(p1(2)) (p1(2)) (p1(2)+offset(2)) (p1(2)+offset(2)) (p1(2))];
x1 = round(xCoords(1));
x2 = round(xCoords(2));
y1 = round(yCoords(5));
y2 = round(yCoords(3));
hold on
axis manual
p = plot(xCoords, yCoords, 'b-'); % redraw in dataspace units

% Display the cropped image.

promptMessage = sprintf('Confirm Crop');
titleBarCaption = 'Continue?';
button = questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
if strcmpi(button, 'Cancel')
	delete(p);
    return;
end

rect = [x1 y1 x2-x1 y2-y1];
% croppedImage = grayImage(y1:y2,x1:x2);
% croppedImage = imcrop(myimage,rect);
croppedImage(:,:,1) = myimage(y1:y2,x1:x2,1);
croppedImage(:,:,2) = myimage(y1:y2,x1:x2,2);
croppedImage(:,:,3) = myimage(y1:y2,x1:x2,3);
cla;
subplot(1,1,1);
imshow(croppedImage);
title('Cropped Image', 'FontSize',20);
end 
