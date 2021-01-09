clc, close all
showClass=6;
erro=1;
quantidade=0;
result =mostrarTudo(resultadoPorFoto,pathImages,showClass,erro,quantidade,nTreino);
if ~erro
disp(strcat('O modelo acerto para a classe ',int2str(showClass),' : ',...
    int2str(result),'%'));
%histogram(result);
%histogram(result,'Normalization','probability')
else 
    disp(strcat('O modelo errou para a classe ',int2str(showClass),' : ',...
    int2str(result),'%'));
%histogram(result);
%histogram(result,'Normalization','probability')
end






