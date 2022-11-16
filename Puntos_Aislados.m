clc;
clear all;
close all;

%Abrir imagen
se=imread('IMG/1A.png');
[f c d]=size(se);
se=imresize(se,[270 280]);
se=rgb2gray(se);
seB=se;
seW=se;
for i=1:270
    for j=1:280
        if se(i,j)~=0
            seB(i,j)=1;
            seW(i,j)=254;
        else
            seB(i,j)=0;
            seW(i,j)=255;
        end
    end
end

seW=double(seW);
seB=double(seB);

%Se propone crear imagenes de 1080x1080
for i=1:1080
    for j=1:1080
        Bb(i,j)=0;
        Wb(i,j)=255;
    end
end

%Añadir valor diferente
for i=1:270
    for j=1:280
        Bb(i,j)=seB(i,j);
        Wb(i,j)=seW(i,j);
    end
end

%Mascara para detectar puntos aislados
w=[-1,-1,-1;-1,8,-1;-1,-1,-1];

%Detectamos los puntos aislados del fondo negro
gb=abs(imfilter(Bb,w));

%Detectamos los puntos aislados del fondo blanco
gw=abs(imfilter(Wb,w));

Bb=uint8(Bb);
Wb=uint8(Wb);
gb=uint8(gb);
gw=uint8(gw);

%Mostramos normal
figure
subplot(2,2,1)
imshow(Bb)
title('Original')
subplot(2,2,2)
imshow(gb)
title('Puntos Aislados solo mascara')
subplot(2,2,3)
imshow(Wb)
title('Original')
subplot(2,2,4)
imshow(gw)
title('Puntos Aislados solo mascara')

%Mostramos con algo extra
for i=1:1080
    for j=1:1080
        if gw(i,j)==0
            gw(i,j)=255;
        end
    end
end
for i=1:1080
    for j=1:1080
        if gb(i,j)~=0
            gb(i,j)=255;
        end
    end
end
figure
subplot(2,2,1)
imshow(Bb)
title('Original')
subplot(2,2,2)
imshow(gb)
title('Resaltado')
subplot(2,2,3)
imshow(Wb)
title('Original')
subplot(2,2,4)
imshow(gw)
title('Resaltado')