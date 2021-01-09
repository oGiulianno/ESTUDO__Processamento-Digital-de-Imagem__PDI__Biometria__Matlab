%Projeta uma nova amostra no espa�o vetorial P
%Entrada:
%   x = amostra a ser projetada
%   mn = m�dia de cada coluna da matriz de dados
%   P = dados no novo espa�o vetorial (autofaces no caso de imagens)
%Sa�da:
%   x = amostra no novo espa�o vetorial

function x = ProjetarAmostra(x,mn,P)
    x = reshape(x,[],1);
    x = double(x) - mn;
    x = P' * x;
    
end
