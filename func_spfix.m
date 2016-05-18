function func_spfix(objh,event)
myimage=getimage(gca);

if size(myimage,3) ~= 3 
    myimage= cat(3, myimage, myimage, myimage);
end


k = waitforbuttonpress;
point1 = get(gca,'CurrentPoint')  % button down detected
finalRect = rbbox;                   % return figure units
point2 = get(gca,'CurrentPoint');    % button up detected
point1 = point1(1,1:2);              % extract x and y
point2 = point2(1,1:2);
p1 = min(point1,point2);             % calculate locations
offset = abs(point1-point2);         % and dimensions
% Find the coordinates of the box.
xCoords = [p1(1) p1(1)+offset(1) p1(1)+offset(1) p1(1) p1(1)]; %4 lines 5 points
yCoords = [p1(2) p1(2) p1(2)+offset(2) p1(2)+offset(2) p1(2)];
x1 = round(xCoords(1));
x2 = round(xCoords(2));
y1 = round(yCoords(5));
y2 = round(yCoords(3));
[rows, columns, numberOfColorBands] = size(myimage);
croppedImage(:,:,1) = myimage(y1:y2,x1:x2,1);
croppedImage(:,:,2) = myimage(y1:y2,x1:x2,2);
croppedImage(:,:,3) = myimage(y1:y2,x1:x2,3);


% Paste it onto the original image
[rows2, columns2] = size(croppedImage);
promptMessage = sprintf('Click the point you want to heal');
titleBarCaption = 'Continue?';
button = questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
if strcmpi(button, 'Cancel')
	return;
end
[x, y] = ginput(1)
% Determine the pasting boundaries.
r1 = int32(y);
c1 = int32(x);
r2 = r1 + rows2 - 1;
r2 = min([r2 rows]);
c2 = c1 + columns2 - 1;
c2 = min([c2, columns]);
plot([c1 c2 c2 c1 c1], [r1 r1 r2 r2 r1], 'r-');
x2-x1
% Paste as much of croppedImage as will fit into the original image.
myimage(r1:r2, x:(x+(x2-x1)),1) = myimage(y1:y2,x1:x2,1);
myimage(r1:r2, x:(x+(x2-x1)),2) = myimage(y1:y2,x1:x2,2);
myimage(r1:r2, x:(x+(x2-x1)),3) = myimage(y1:y2,x1:x2,3);

subplot(1,1,1);
imshow(myimage);
end