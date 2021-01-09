clear all, close all, clc
%%

% DECLARÇÂO

pathImages='imagens';

folders=ls(pathImages);
sizeFoldeers=size(folders,1);
nPhotos=10; %número de fotos dentro de cada pasta que deseja verificar
% mudar percentTrain de acordo o desejado, Porcento de Treino que se refere
% redimensionar pra deixar tudo do mesmo tamanho
percentTrain=50; % 50 60 70
nTreino =round( nPhotos*(percentTrain/100));

redimensionar=[500 500];


%%

%Geração da base de treinamento
data = criarBanco(pathImages,redimensionar,nPhotos-nTreino);

%data_train = lerImgs(pathImages, percentTrain); % LER IMAGEM
%data_train = lerImgs(pathImages,(nPhotos-nTreino)); % LER IMAGEM TESTE
%data_train = lerImgs(folders, sizeFoldeers);

%data = criarBanco(pathImages,(nPhotos-nTreino)); % CRIAR BANCO

%[P PC mn] = GerarPCs(double(data_train)); % LER IMAGEM
[P PC mn] = GerarPCs(double(data)); % CRIAR BANCO


%%
close all
%%

idx = ones(1,(sizeFoldeers-2)*(nTreino));
for i = 1:sizeFoldeers-2
    idx(1, nTreino*(i-1)+1:nTreino*i) = i;
end
forClass=zeros(sizeFoldeers-2,1);
resultadoTotal =0;
 
%%

% primeira coluna é o resultado classificado, a 2 é o que é o certo e a 3 é
% o arquivo dentro da subpasta
cont=1;
resultadoPorFoto=zeros((nPhotos-nTreino)*(sizeFoldeers-2),3);
for i = 3:sizeFoldeers
    subFolderTemp=strcat(pathImages,'\',folders(i,:),'\');
    files=ls(subFolderTemp);
    for j = nTreino+1:nPhotos
        fileNameTemp =strcat(subFolderTemp, files(j,:));
        
        %x = pdi(imread(fileNameTemp))
        
        %x = imread(fileNameTemp)
        
        x = imresize(imread(fileNameTemp),redimensionar);
       
        d = Classificar(PC, ProjetarAmostra(x,mn,P));
       h = idx(d); 
       if(h == i-2)
            resultadoTotal = resultadoTotal+1; 
            forClass(h)=forClass(h)+1;
       end
       resultadoPorFoto(cont,:,:)=[h,i-2 ,j];  
       cont=cont+1;
    end
end

%%

resultadoTotal=100*resultadoTotal/(size(forClass,1)*(nPhotos-nTreino));

allclass= forClass./nTreino*100; 

 resultadoErro = 100 - resultadoTotal;
 resultadoErroClasses = 100 - allclass;
 
 %histogram(allclass);
    
%SAVE PARA CADA TIPO DE PORCENTAGEM TESTADA
%TIRE O COMENTÁRIO DE UMA E COMENTE O RESTO
save('cachorro-PCA-N-50.mat')
%save('cachorro-PCA-N-60.mat')
%save('cachorro-PCA-N-70.mat')
