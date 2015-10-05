function [fitn] = fitness2(Pop,I)
    alpha = 0:0.1:2*pi;
    [x,y] = elipseCoordinates(Pop,I,alpha);
    %% testing
    % calculo fitness
    %comprobamos el matching con la imagen
    P = size(Pop,1);
    fitn = zeros(P,1);
    for e=1:1:P
        I2 = I;
        for i=1:1:size(x,2)
           % pone cada pixel visitado a 1
           fitn(e) = fitn(e)+~(I2(y(e,i),x(e,i)));
           I2(y(e,i),x(e,i)) = 1;
        end
    end
    pngr = fitn;
    % Nummero de puntos negros, en lugar de blancos
    %% Funciones de fitness: Por defecto saca nº de pixeles (que no está tan mal)
    %% [0] cuantos más mejor
%     fitn = 1-1./(pngr+1);
    %% [1] Proporcion de puntos negros / puntos de la elipse
    % El que mejor resultados ha dado
    fitn = pngr./size(x,2);
    %% [2] cociente de summas (presentes entre mmaximos)
%     fitn = (pngr+a+b)./(size(x,2)+36+36);
    %% [3] Potenciar color-matches
%     fitn = 1-1./(pngr+1);
%     fitn = fitn.*sqrt(a.*b)/36;
    %% [4] Potenciar baja excentricidad
%     fitn = pngr/size(x,2).*sqrt(2./((a./b)+(b./a)));
    %% [5] Cantidad de puntos negros y proporción de ptos negros
%     fitn = pngr.*(a+b)/(72*63);
    %% [6] Cantidad de ptos, proporción de ptos y baja excentricidad
%     fitn = pngr.*(a+b).*2./(72*63.*((a./b)+(b./a)));
    %% [7] A lo bestia. ptos/ptos_POSIBLES
%     fitn = pngr./(2*size(I,2));
end
        