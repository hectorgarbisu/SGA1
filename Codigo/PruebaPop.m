% prueba pop

Pop = Inicializa_poblacion(2000);
[x,y,a,b,x0,y0,theta] = elipseCoordinates(Pop);
subplot(4,1,1)
grid on
axis([-10 110 -10 110])
axis equal
hold on
for i=1:1:size(x,1)
%     if ((min(x(i,:))<1) | (min(y(i,:))<1))
%         disp([(min(x(i,:))),(min(y(i,:)))]);
%     end
%     if ((max(x(i,:))>100) | (max(y(i,:))>100))
%         disp([(max(x(i,:))),(max(y(i,:)))]);
%     end
    plot( x(i,:),y(i,:));
end
hold off
subplot(4,1,2)
[c,b] = hist(a);
plot(b,c)
title('a')
subplot(4,1,3)
[c,b] = hist(x0);
plot(b,c)
title('x0')
subplot(4,1,4)
[c,b] = hist(theta);
plot(b,c)
title('theta')
% plot(sort(50.*(cos(theta)+sin(theta))))
