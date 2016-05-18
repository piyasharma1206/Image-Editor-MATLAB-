clc;
close all;
clear all;
%% Image Editor

figure

[FileName,PathName,FilterIndex] = uigetfile({'*.jpg';'*.png';'*.bmp';'*.tiff'},'Select the image you want to edit');

%%FileName
%%PathName
%%FilterIndex

file_loc=fullfile(PathName,FileName);

if ~exist(file_loc, 'file')
		% Still didn't find it.  Alert user.
		errorMessage = sprintf('Error: %s does not exist in the search path folders.', fullFileName);
		uiwait(warndlg(errorMessage));
		return;
end


grayImage = imread(file_loc);
% Get the dimensions of the image.
% numberOfColorBands should be = 1.
[rows, columns, numberOfColorBands] = size(grayImage);
% Display the original gray scale image.
%%subplot(2, 2, 1);
imshow(grayImage);
axis on;
title('Image', 'FontSize', 20);
% Enlarge figure to full screen.
%%set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
% Give a name to the title bar.
set(gcf,'name','Your MATLAB Image Editor','numbertitle','off')

cropbtn = uicontrol('Style', 'pushbutton', 'String', 'Crop',...
        'Position', [10 130 100 40],...
        'Callback',({@func_crop}));
graybtn = uicontrol('Style', 'pushbutton', 'String', 'GrayScale',...
        'Position', [10 480 100 40],...
        'Callback', @func_grayScale);
% Create slider

% Add a text uicontrol to label the slider.
    txt = uicontrol('Style','text',...
        'Position',[10 430 100 20],...
        'String','Adjust Contrast');

r_slider = uicontrol('Style', 'slider',...
        'Min',0.5,'Max',0.9,'Value',0.6,...
        'Position', [10 370 100 40],...
        'Callback', @func_r);
g_slider = uicontrol('Style', 'slider',...
        'Min',0.5,'Max',0.9,'Value',0.6,...
        'Position', [10 310 100 40],...
        'Callback', @func_g);    
    
b_slider = uicontrol('Style', 'slider',...
        'Min',0.5,'Max',0.9,'Value',0.6,...
        'Position', [10 250 100 40],...
        'Callback', @func_b); 
    
btn = uicontrol('Style', 'pushbutton', 'String', 'Rotate',...
        'Position', [10 190 100 40],...
        'Callback', @func_rotate);

spfix = uicontrol('Style', 'pushbutton', 'String', 'Spot Healing',...
        'Position', [10 540 100 40],...
        'Callback', @func_spfix);
    
btn = uicontrol('Style', 'pushbutton', 'String', 'Clear',...
        'Position', [10 60 100 50],...
        'Callback', ({@showgray,grayImage}));

exportMe = uicontrol('Style', 'pushbutton', 'String', 'EXPORT',...
        'Position', [1250 550 100 80],...
        'Callback', @func_export);

    
