
%% How to create a chroma key script
%Abstract: Chroma key is a visual technique which has been used heavily in 
%audiovisual areas like tv or cinema. 
%It consists in taking images on a uniform background, green or blue 
%background, in order to remove the background from a subject of a photo.
%This is a MATLAB script that realizes an algorithm able to substitute
%the background on an image.

%Reading images.
blackground=imread('beach2.jpg');
foreground=imread('Clarissa-Knorr.jpg');

%Converting array to double precision. We also normalize.
foreground=double(foreground)/255; 
blackground=double(blackground)/255; 

%Array size (image)
[x,y,k]=size(foreground);
%Create array with the same datas than foreground
im_final=foreground;

%The process is to analize all pixels and to decide if the pixel is inside
%or outside the threshold.
%The threshold value depends on the background colour.
for i=1:x
 for j=1:y
 if foreground(i,j,2)>=0.50 && foreground(i,j,1)<0.50 && foreground(i,j,3)<0.9
 im_final(i,j,:)=blackground(i,j,:);
 end
 end
end

%Note: If you dont know what threshould you need to remove the background
%you can make a study using the next command:
%imshow(background), improfile
%You can select different areas of the image and it will appear a plot with the
%RGB values later. Obviously, the selected area should be the background.

%Displaying multiple plots
figure(1);
subplot(121);
imshow(foreground);
title('Foreground')
subplot(122);
imshow(blackground);
title('Background')

figure(2);
imshow(im_final);
title('Chroma-key')
