%----------------------------------------------------%
%----------------------------------------------------%
% Elabora��o da Regra R3 de Carregamento.            %
%----------------------------------------------------%
%----------------------------------------------------%
% Procedimento de preenchimento:                     %
%----------------------------------------------------%
%  (1) Esta regra � o espelho da regra Rc1. No porto p,
%  a matriz de ocupa��o B ser� preenchida por linha, da
%  direita para a esquerda, colocando na parte inferior
%  da linha, as cargas cujo destino � mais distante.  
%      m ^
%        |6 5 4 
%        |3 2 1
%      1 -----> 
%        1    n
%
%  (2) Coloca um cont�iner de cada vez, conforme
%      eles v�o sendo retirados do p�tio.
%
%  (3) Retorna a matrix que representa o navio, preenchida
%      de acordo com a regra de carregamento Rc3.
%----------------------------------------------------%
function [Navio] = Rc3(Navio,conteiner) 

% [linha,coluna]=size(Navio);
% 
% if  length(find(Navio(1,:)~=0)) == coluna     
%     msg = 'Problema na fun��o Rc3 !! N�o foi poss�vel carregar todos os containeres!! Espaco insufiente !! \n ';
%     error(msg)
% end

for t=1:size(Navio,2) % de 1 ateh o numero de baias
    Nv=Navio{1,t};
    [linha,coluna]=size(Nv);
% Ordem que vai percorrer
    for i = (linha:-1:1) %corrigindo a ordem de verifica��o.
         for k = (coluna:-1:1)   
             if Nv(i,k) == 0
                Nv(i,k) = conteiner; 
                conteiner=0;
                break
             end
         end
           if conteiner == 0
              break 
           end
    end
       if conteiner == 0
              Navio{1,t}=Nv;
            break         
       end
end
 
end

