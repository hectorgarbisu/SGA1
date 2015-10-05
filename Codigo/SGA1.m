%% Algoritmo geneticorl
%% Meta parámetros
% Tamaño de la población
psize = 160;
% Reproductores por generacion (psize-poda)
repro = 2*round((psize/10)); %aproximadamente un 20% y que sea par
% Numero de iteraciones
maxiter = 120;
% Probabilidad de mutación
pmut = 1/psize;
% Cantidad de elitismo
l33t = 2;
% Miembros de la elite que NO pueden mutar
emut = 0;
% Imagen
% aleatoria
%  I = randi([0 1], 100);
% images es un 3TENSORRR
images = cat(3,imread('enblanco.bmp'), imread('ennegro.bmp'), imread('unaelipse.bmp'), imread('circulogrande.bmp'), imread('circulograndeychico.bmp'), imread('elipse2.bmp'),  imread('elipse3.bmp'),imread('elipse4.bmp'),imread('elipse5.bmp'), imread('2elipses.bmp'), imread('circulochico.bmp'), imread('circulochicorelleno.bmp'), imread('barranegra.bmp'), imread('cosa1.bmp'), imread('cosa2.bmp'));
images = cat(3,images, ~imread('Assorted_United_States_coins_contraste_alto_Gray_Scale_100x100_sobel_mono.bmp'));
images = cat(3,images, ~imread('Gold-Coins_alto_contraste_grayscale_100x100_sobel_mono.bmp'));
images = cat(3,images, ~imread('pound-coins2_contraste_alto_gray_scale_100x100_sobel_mono.bmp'));
I = images(:,:,9); % imagen a usar en esta ejecución
% I=~imread('pound-coins2_contraste_alto_gray_scale_100x100_sobel.jpg');
% I=images(:,101:200)

% Hall of fame (mejores elipses OF ALL TIME)
HoF = zeros(maxiter,30);
% Fitness de media
medias = zeros(maxiter,1);

%% Inicializacion
Pop = Inicializa_poblacion(psize);

subplot(2,1,2);

imshow(I)
hold on
%% BUCLE PRINCIPAL
for iter=1:maxiter
%pmut va desde 0.5 hasta 1/2maxiter a medida que avanzan las iters
%     pmut = 1/(2*iter);
%% Calculo Fitness
    %Fitness esta calculado de forma que representa una proporcion
    %de pixeles que son cubiertos por la elipse (0. .. 1.)
    fitn = fitness2(Pop,I);
    % Ordenar de mayor a menor por el fitness
    p_f = flipud(sortrows([Pop fitn],30));

%% Seleccion
    chosen = p_f(1:repro,1:29);

%% Cruce
    %La élite puede ser padre, pero también pasará a la siguiente gen.
    chosen(l33t+1:repro,:) = sexyTime(chosen(1:repro-l33t,:));

%% Mutacion :)
    chosen(emut+1:end) = chernobyl(chosen(emut+1:end),pmut);

%% Rellenar población, prepara la siguiente iteracion
    Pop(1:repro,:) = chosen(:,:);
    Pop(repro+1:end,:) = Inicializa_poblacion(psize-repro);
%% Recopilación
    HoF(iter,:) = p_f(1,:);
    avrg = mean(p_f,1);
    medias(iter) = avrg(end);
    if(mod(iter,round(maxiter/20))==0)           
        disp([iter HoF(iter,end) medias(iter)]) 
        [x,y] = elipseCoordinates(HoF(iter,1:29),I,0:0.1:2*pi);
        plot(x,y,'Color',[iter/maxiter 0 1-(iter/maxiter)])
    end
end
%% Fin
% [HoF(:,end) medias]
subplot(2,1,1)
t = 1:maxiter;
%Muestra la convergencia a la solucion final
axis equal
plot(t,HoF(:,end),'-r',t,medias(:,1),'-b');
legend('maximo','media','Location','EastOutside');
ylabel('fitness')
xlabel('iteración')
subplot(2,1,2)
% imshow(I)
hold on
% %Muestra la solucion en verde
[x,y] = elipseCoordinates(HoF(end,1:29),I,1:0.1:2*pi);
e=plot(x,y,'g');
legend(e,'mejor solución','Location','EastOutside');
hold off