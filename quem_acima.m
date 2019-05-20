%
% Nome: quem_acima
% Objetivo: gerar lista de quem esta acima do conteiner, para remanejamento
%
function acima = quem_acima(patio, posicao_navio) %Quem est� acima que n�o � vazio.

linha = posicao_navio(1,1); %posi��o 
coluna = posicao_navio(1,2);
c_lista = 1;  %come�o na posi��o 1.
b=sum(patio(:,coluna) ~= 0);
acima=zeros(b-1,2);

    for a_cont = (1:linha-1) 
       
        if (patio(a_cont,coluna) ~= 0)  %verificando se tem espaco vazio na altura
           acima(c_lista,1) = a_cont;
           acima(c_lista,2) = coluna;
           c_lista = c_lista + 1;  % Depois que insiro na posi��o 1, passo p/ a pr�xima. Mover na lista.
        end
    end
    T=acima(:,1);
    [row]=find(T==0);
    acima(row,:)=[];
    
end
                
  