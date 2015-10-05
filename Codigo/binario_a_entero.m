function [entero] = binario_a_entero(binario)
    entero = zeros(size(binario,1),1);
    L = size(binario,2);
    for i=1:L
        entero(:) = entero(:) + binario(:,i)*2^(i-1);
    end
end