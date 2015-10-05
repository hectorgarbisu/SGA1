%% META
% Iterar por los metaparámetros y ver cuales son mejores
%Modelo: Imagen en blanco y negro (0s y 1s)
%
%Contar el número de puntos que coinciden con la elipse
%Cuac
%% Inicialización
% Una elipse se codifica por:
% a,b,theta,x0,y0
%con una imagen de 100x100
% 5<=a<=50; un total de 46 valores, pero usamos 32 porque binario
% 5<=a<=36; para tener 5bits para codificar a
% a=[0..31]
% b lo mismo, 5 bits
% b=[0..31]
% x0=[5..95] valores minimos y maximos posibles para la posicion de la
% elipse
% Pero por cosa binaria volvemos a hacerlo 64
% x0 = [19,82] 6 bits para x0
% y0 lo mismo, 7 bits
% theta, en grados va de 0 a 180, pero por binario things: 127. 7 bits
% En total, un cromosoma tiene 5+5+6+6+7=29bits 
% El tamaño de la poblacion es variable
% Se suelen coger valores similares de poblacion y numero de iteraciones
% del algoritmo
%Estas variables codificadas hay que convertirlas (bin->dec)
%ajustarlas y escalarlas
%De mayor o menor ordenamos la poblacion por fitness
%% Selección
% El numero de individuos seleccionados deberia ser par (zasca)
%Cuac
%% Cruce
% Las dos primeras filas son los dos primeros individuos de la gen anterior
% 2 point cross over (se intercambia una zona intermedia aleatoria)
%% Mutación
%Cuac
%Probabilidad de mutacion suele ser 1/|pop|
%Se cambia 1 bit de la victima
%% ??
%Cuac
%% Condición de Parada
%Cuac

%% 
