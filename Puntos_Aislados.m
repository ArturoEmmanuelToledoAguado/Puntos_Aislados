clc;
clear all;
close all;

%Se propone crear imagenes de 1080x1080
for i=1:1080
    for j=1:1080
        Bb(i,j)=0;
        Wb(i,j)=255;
    end
end

%Mostramos
figure()
imshowpair(Bb,Wb,"montage")