function acertosClass=mostrarTudo(resultadoPorFoto,pathImages,showClass,erro,quantidade,nTreino)
%function acertosClass=mostrarTudo(resultadoPorFoto,pathImages,showClass,erro,quantidade)
% passe a variavel resultado por foto
% o caminho das imagens
% o número da classe que quer representar 
% se erro =1 mostra o que errou naquela classe se 0 mostra o que acertou
% quantidade é quantas fotos queres mostrar se 0 mostra tudo
subFolder=ls(pathImages);
nameFolder=subFolder;
subFolder= strcat(pathImages,'\',subFolder(showClass+2,:),'\');
nameImages=strcat(subFolder,ls(subFolder));
totalImages=size(ls(subFolder),1)-2;
if quantidade==0
    quantidade=totalImages;
elseif quantidade >totalImages
    quantidade=totalImages;
end

classeSeparada=[0,0,0];
mostrado=0;
acertosClass=0;
if erro
    for i=1:size(resultadoPorFoto,1)
     if resultadoPorFoto(i,2)==showClass
          if resultadoPorFoto(i,2)~=resultadoPorFoto(i,1)
              acertosClass = acertosClass+1;
              figure();
              tt=strcat(pathImages,'\',nameFolder(resultadoPorFoto(i,1)+2,:),'\');
              tt=strcat(tt,ls(tt));
              
              imshowpair(imread(nameImages(resultadoPorFoto(i,3)+2,:)),...
                  imread(tt(3,:)),'montage');
              title(strcat("Não é da classe da ", ...
                  nameFolder(resultadoPorFoto(i,2)+2,:)," Mas é um da ", ...
                  nameFolder(resultadoPorFoto(i,1)+2,:)));
              mostrado=mostrado+1;
               if mostrado==quantidade
                  i=size(resultadoPorFoto,1)+1;
              end
          end   
     end
    end
    acertosClass=acertosClass/nTreino*100;
    %h = histogram(acertosClass);
else 
    for i=1:size(resultadoPorFoto,1)
     if resultadoPorFoto(i,2)==showClass
          if resultadoPorFoto(i,2)==resultadoPorFoto(i,1)
              acertosClass=acertosClass+1;
              figure()
              imshowpair(imread(nameImages(resultadoPorFoto(i,3)+2,:)),...
                  imread(nameImages(3,:)),'montage');
              title(strcat("Primeira imagem é da classe da ", ...
                  nameFolder(resultadoPorFoto(i,2)+2,:)));
                     mostrado=mostrado+1;
              if mostrado==quantidade
                  i=size(resultadoPorFoto,1)+1;
              end
          end   
     end
    end
    acertosClass=acertosClass/nTreino*100; 
    %h = histogram(acertosClass);
end
end