%Classificador: Distância Euclidiana
%Entrada:
%   PC = Conjunto de treinamento
%   x = amostra a ser comparada
%Saída
%d = posição do item com a menor distância euclidiana entre a amostra e as
%colunas do conjunto de treinamento
function d = Classificar(PC,x)
    minDist = norm(PC(:,1) - double(x));
    d = 1;
%     começa em 2 pois se minDist==0 o elemento 1 é o certo
    for j = 2:size(PC)
        EucDist = norm(PC(:,j) - double(x));
        if minDist > EucDist
            d = j;            
            minDist = EucDist;
        end
    end
end