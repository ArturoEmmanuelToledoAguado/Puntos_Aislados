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

%Añadir valor diferente
for i=1:270
    for j=1:2:540
        Bb(i,j)=5;
        Wb(i+j,j+i-1)=250;
    end
end

Bb=uint8(Bb);
Wb=uint8(Wb);

%Mostramos
figure
imshow(Bb)
figure
imshow(Wb)