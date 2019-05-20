function[lista_descarregamento] = Quem_Sai(Navio,porto,NPorto)

N=length(find(porto(1,:)==NPorto));
lista_descarregamento=zeros(N,3);
contador=1;
for z=1:size(Navio,2)
    [k,l]=size(Navio{1,z});
    for i=1:k
        for j=1:l
            if Navio{1,z}(i,j)~=0
                [row]=find(porto(2,:)==Navio{1,z}(i,j));
                if porto(1,row)==NPorto
                   lista_descarregamento(contador,1)=i; %linha
                   lista_descarregamento(contador,2)=j; %coluna
                   lista_descarregamento(contador,3)=z; %baia 
                   contador=contador+1;
                end            
            end
        end
    end
end
end