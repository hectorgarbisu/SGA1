function [mutated_chosen] = chernobyl(chosen,pmut)
    mutated_chosen = chosen;
    for i = 1:size(chosen,1)
        %Una forma más de tener una dist. uniforme
        if rand(1)<=pmut
%             binary_index = randi([1 29]);
            binary_index = floor((rand().*29)+1);
            mutated_chosen(i,binary_index) = ~mutated_chosen(i,binary_index);
        end
    end
end