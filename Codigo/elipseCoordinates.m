function [x,y,a,b,x0,y0,theta] = elipseCoordinates(Pop,I,alpha)
    if nargin < 3
      alpha=0:0.1:2*pi;
    end
    if nargin < 2
      I=ones(100);
    end
    iw = size(I,2)-1;
    ih = size(I,1)-1;
    % Extracción de valores binarios
    bina = binario_a_entero(Pop(:,1:5));
    binb = binario_a_entero(Pop(:,6:10));
    binx0 = binario_a_entero(Pop(:,11:16));
    biny0 = binario_a_entero(Pop(:,17:22));
    theta = binario_a_entero(Pop(:,23:29));
    
    % ESCALADO
    % A[a..b] -> C[c..d]
    % C = (A-a)*(d-c)/(b-a)+c
    % theta[0..127] -> theta[0..pi/2]
    theta = (theta+1)./128;
    theta = theta.*pi./2;
    % 5<=a<=36;
    % a[0..31] -> a[0..49]
    % a = a*(49-5)/31+5
    % 19<=x0<=82
    % x0[0..63] -> x0[5..95]
    % x0 = (x0)*(90)/63+5;
    
    %% [1] ajuste chano
%     a = round(bina+5);
%     b = round(binb+5);
%     x0 = round(binx0+19);
%     y0 = round(biny0+19);

    %% [2] ajuste tocho
    % eje principal
    a = (bina);
    a = a./(34-0);
    maxa = (50./max(sin(theta),cos(theta))-5);
    a = floor(a.*maxa);
    a = a+5;
%     b = 0*binb;
    % segundo eje en funcion del primero
    b = binb;
    b = b./(34-0);
    % dada una a, bmax será igual a la mitad del ancho del rectángulo máximo
    % bmax = min(proyecciones perpendiculares a a sobre los bordes de la imagen)
    % hay cuatro variaciones de la proyección (4 bordes de la imagen)
    maxb = min((50-a.*sin(theta))./cos(theta),(50-a.*cos(theta))./sin(theta));
    maxb = min(maxb,(50+a.*sin(theta))./cos(theta));
    maxb = min(maxb,(50+a.*cos(theta))./sin(theta));
    b = floor(b.*maxb);
    %% Ajuste de posicion
    x0max = (a.*cos(theta)+b.*sin(theta));
    x0min = (iw-x0max);
    y0max = (a.*sin(theta)+b.*cos(theta));
    y0min = (ih-y0max);
    x0 = binx0/70;
    x0 = x0.*(x0max-x0min)+x0min;
    y0 = biny0/70;
    y0 = y0.*(y0max-y0min)+y0min;
    
    %% Expansión horizontal de x0,y0 y theta para poder sumarlos a la matriz
    unos = ones(1,size(alpha,2));
    x0 = x0*unos;
    y0 = y0*unos;
    theta = theta*unos;
    
    %% calculo de puntos
    x = round((a*cos(alpha)).*cos(theta) - (b*sin(alpha)).*sin(theta) +x0);
    y = round((a*cos(alpha)).*sin(theta) + (b*sin(alpha)).*cos(theta) +y0);
%     x = round((a*cos(alpha)+x0).*cos(theta) + (b*sin(alpha)+y0).*sin(theta));
%     y = round((a*cos(alpha)+x0).*sin(theta) + (b*sin(alpha)+y0).*cos(theta));
%     
    %% doblando ajuste a las esquinas de la imagen
%     x = min(x,iw);
%     x = max(x,1);
%     y = min(y,ih);
%     y = max(y,1);
    %% testing
end