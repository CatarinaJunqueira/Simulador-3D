% Nome: Desquarnecido 2
%----------------------------------------%
% localiza posi��es vazias que s�o topo ou      3 6 9
% ch�o para a regra Rt2:                        2 5 8
%                                               1 4 7
%----------------------------------------%

function [vazio] = desguarnecido2(patio,posicao_navio) % localiza posi��o e n�o conte�do.

[linha,coluna]=size(patio);
pos_larg = posicao_navio(1,2);
c_local = 1; % inicializando um contador. 

%Criando o vetor vazio
T=length(find(patio(:,pos_larg)~=0)); % T � a qntd de cont existentes na coluna do cont que eu quero tirar
if T == coluna
   % se a coluna do cont que eu quero tirar est� completa
   vazio = zeros(length(find(patio(1,:)==0)),2); 
else
    % se a coluna do cont que eu quero tirar n�o est� completa
   vazio = zeros(length(find(patio(1,:)==0))-1,2);
end

colunas_p = 1:coluna;
colunas_p = colunas_p(colunas_p~=pos_larg);

% Ordem que vai percorrer
    for k = colunas_p %corrigindo a ordem de verifica��o.
         for i = (linha:-1:2)
             
           if patio(i,k)~= 0 % se a posicao eh diferente de zero
               if patio(i-1,k)== 0 % se a posicao acima eh zero
                vazio(c_local,1) = i-1; % ent�o insere
                vazio(c_local,2) = k;
                colunas_p = colunas_p(colunas_p~=k) ;
                c_local = c_local + 1;    % lista de vazios/cont�ineres (posi��o no p�tio)                   
               end

           else
                if (i==linha) % se eh chao
                    vazio(c_local,1) = i;
                    vazio(c_local,2) = k;
                    colunas_p = colunas_p(colunas_p~=k) ;
                    c_local = c_local + 1;    % lista de vazios/cont�ineres (posi��o no p�tio)
                end
           end

         end   
    end 
    if size(vazio,1)==0
       msg = 'Problema na fun��o desguarnecido1 !! size(vazio,1)=0. ';
       error(msg) 
    end    
end


