

function [patio,conteiner] = remover(patio,posicao_navio) %tira do patio

linha = posicao_navio(1,1); %posi��o 
coluna = posicao_navio(1,2);

conteiner = patio(linha,coluna); % salvando o n�mero (identifica��o) do cont�iner na vari�vel 'ind' 
patio(linha,coluna)=0;  % substitui o conte�do do conteiner retirado por 0.

end