function [prole,punto1,punto2] = sexyTime(padres)
    %% papas y mamás
%     prog1 = padres(1:2:end,:);
%     prog2 = padres(2:2:end,:);
%     prole = padres;
    prole = padres(randperm(size(padres,1)),:); %Parejas aleatorias
    %% generación de puntos de corte
    % versión implementada: 
    % 1 [  ] Un par de puntos de corte por cada par de padres
    % 2 [->] El mismo par de puntos de corte para toda la generación
    
    minwindow = 1;
    max_primer = size(padres,2)-(2+minwindow);
    max_segundo = size(padres,2)-1;
     %% Versión 2
%     punto1 = round(rand().*(max_primer-2)+2);
%     punto2 = round(rand().*(max_segundo-(punto1+2))+punto1+2);
%     prole(1:2:end,punto1:punto2) = prole(2:2:end,punto1:punto2);
%     prole(2:2:end,punto1:punto2) = prole(1:2:end,punto1:punto2);
%     punto2 = randi([punto1+2 max_segundo]);
    %% Versión 1 
    for i = 1:2:size(padres,1) % de dos en dos
        punto1 = round(rand().*(max_primer-2)+2);
        punto2 = round(rand().*(max_segundo-(punto1+2))+punto1+2);
        prole(i,punto1:punto2) = padres(i+1,punto1:punto2);
        prole(i+1,punto1:punto2) = padres(i,punto1:punto2);
    end

end