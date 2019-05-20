function [prioridade]=Prioridade(col_n,Navio,porto)

l=size(Navio,2); % quantidade de colunas desta baia
m=size(Navio,1); % quantidade de linhas desta baia
prioridade=zeros(1,l); % criando a lista de prioridades da baia
Pr=zeros(m,1);
N=max(max(porto(1,:)));

for j=1:l %Para j de 1 até o número de colunas.   
    if nnz(Navio(:,j))==0 % se a coluna está vazia, entao a prioridade eh igual ao ultimo porto + 1
      prioridade(1,j)=N+1;
      continue
    end
    TF=isempty(find(Navio(:,j)==0, 1));
    if TF==0 && j~=col_n % só meço a prioridade das colunas não cheias e das colunas diferentes da coluna onde o bloco r está.    
       contador=1;
       for i = 1:m
           if Navio(i,j) ~=0
               [row]=find(porto(2,:)==Navio(i,j)); %encontrando a coluna na matriz 'porto' onde esta o conteiner(i,j)
               Pr(contador) =  porto(1,row); %colocando os portos de destino dos conteineres desta coluna em uma lista              
              contador=contador+1;
           end
       end
            %agora deve-se encontrar qual a maior prioridade desta coluna,
            %ou seja, o porto de destino mais próximo
            prioridade(1,j)=min(Pr(Pr>0)); 
            Pr=zeros(m,1);
    end
end

end