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
for i=1:4:1080
    for j=1:5:1080
        Bb(i,j)=5;
        Wb(i,j)=252;
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

%Mostramos
figure
subplot(1,2,1)
imshow(Bb)
title('Original')
subplot(1,2,2)
imshow(gb)
title('Puntos Aislados')

figure
subplot(1,2,1)
imshow(Wb)
title('Original')
subplot(1,2,2)
imshow(gw)
title('Puntos Aislados')