%pruebaAjustes
Pop = Inicializa_poblacion(100);
iw = 100;
ih = 100;
a = binario_a_entero(Pop(:,1:5));
b = binario_a_entero(Pop(:,6:10));
x0 = binario_a_entero(Pop(:,11:16));
y0 = binario_a_entero(Pop(:,17:22));
theta = binario_a_entero(Pop(:,23:29));
theta = theta./127;
theta = theta.*pi./2;
theta = pi.*(theta./(4.*theta));
a = (a-0);
a = a/(31-0);
a = a.*(45.*sin(theta)+50.*cos(theta)-5)+5;
b = (b-0);
b = b./(31-0);
b = b.*(((50-a.*(cos(theta)))./(sin(theta)))-5)+5;
[x,y] = pol2cart(theta,a);
% plot(x,y);
plot(a,b)
grid on
axis([0 70 0 70])

max(a)