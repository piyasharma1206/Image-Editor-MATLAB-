function func_export(objhandler,event)
myimage=getimage(gca);

if size(myimage,3) ~= 3 
    myimage= cat(3, myimage, myimage, myimage);
end

answer = inputdlg('Enter New File Name','New File Name');
ext='.png';
mypath='C:\Users\yash.sachdeva009\Desktop\matlab docs\editedImages\';
 %myfullfile=fullfile('C:','Users','yash.sachdeva009','Desktop','matlab docs','editedImages', [answer, '.png']);
 myfullfilep=strcat(mypath,answer{1},ext);
 myfullfilep
 imwrite(myimage,myfullfilep);
%imwrite(myimage,'C:\Users\yash.sachdeva009\Desktop\matlab docs\editedImages\abc.png');
end