function z = criarBanco(pathImages, redimensionar,treinar)
%function z = criarBanco(pathImages,treinar)
% treinar é quantidade de imagens a treinar.
% redimensionar é para padronizar o tamanho
z = [];
sizeFolders=size(ls(pathImages),1)-2;
tam=sizeFolders;
tam=tam-(tam-treinar);
folders=ls(pathImages);

for j = 1:sizeFolders
    subFolderTemp=strcat(pathImages,'\',folders(j+2,:),'\');
    files= strcat(pathImages,'\',folders(j+2,:),'\',ls(subFolderTemp));
    nFiles=size(files,1);
    for k = 3:nFiles-tam
        fileNameTemp = files(k,:);
        %x = pdi(imread(fileNameTemp));
        %x = imread(fileNameTemp);
        x = imresize(imread(fileNameTemp),redimensionar);
        y = reshape(x,[],1);
        z = [z , y];
    end
end
end