fs = [];
ps = 1:1:100;
for i = ps
%     pmut = i
    for j=1:1 % Incrementa este numero para más consistencia
        fval = HoF(end,end);
        SGA1
    end
    fs = [fs mean(fval)];
end
figure
plot(ps,fs)
xlabel('variable')
ylabel('maximo fitness')