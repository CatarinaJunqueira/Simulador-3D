%Como os cont�ineres j� tem uma ordem espec�fica para sair, n�o importa a
%ordem que eu percorro. Apenas localizo sua posi��o na matriz e coloco na
%lista 'posicoes'.

function [posicoes] = encontraCaserta(P) % localiza posi��o e n�o conte�do.
n=max(max(P));
o=min(P(P > 0));

if n==0 && isempty(o)==1
    posicoes=[];
else
    
    row=zeros(n-o+1,1);
    col=zeros(n-o+1,1);
    i=1;
     for j=o:n
         [row(i),col(i)]=find(P==j);
         i=i+1;
     end
    posicoes=zeros(n-o+1,2);
    posicoes(:,1)=row;
    posicoes(:,2)=col;   
end


   
end

