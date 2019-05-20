%Como os cont�ineres j� tem uma ordem espec�fica para sair, n�o importa a
%ordem que eu percorro. Apenas localizo sua posi��o na matriz e coloco na
%lista 'posicoes'.

function [posicoes] = encontraCasertaDescarregamento(P) % localiza posi��o e n�o conte�do.

o=unique(P)';
if o(1)==0
    o(1)=[];
end
i=1;
 for j=o
     [row(i),col(i)]=find(P==j);
     i=i+1;
 end
posicoes=zeros(size(o,2),2);
posicoes(:,1)=row;
posicoes(:,2)=col;
   
end

