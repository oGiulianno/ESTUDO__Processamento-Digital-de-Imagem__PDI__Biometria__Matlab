function somatorio=mediaImg(img)
somatorio=0;
for i=1:size(img,1)
    for j=1:size(img,2)
 
            somatorio=somatorio+double(img(i,j));
 
    end
end
somatorio=somatorio/(i*j);
end
