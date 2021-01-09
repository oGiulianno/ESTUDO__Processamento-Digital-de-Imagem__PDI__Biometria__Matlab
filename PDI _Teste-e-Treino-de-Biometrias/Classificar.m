%Classificador: Dist�ncia Euclidiana
%Entrada:
%   PC = Conjunto de treinamento
%   x = amostra a ser comparada
%Sa�da
%d = posi��o do item com a menor dist�ncia euclidiana entre a amostra e as
%colunas do conjunto de treinamento
function d = Classificar(PC,x)
    minDist = norm(PC(:,1) - double(x));
    d = 1;
%     come�a em 2 pois se minDist==0 o elemento 1 � o certo
    for j = 2:size(PC)
        EucDist = norm(PC(:,j) - double(x));
        if minDist > EucDist
            d = j;            
            minDist = EucDist;
        end
    end
end