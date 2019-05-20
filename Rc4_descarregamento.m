%----------------------------------------------------%
%----------------------------------------------------%
% Elabora��o da Regra R4 de Carregamento.            %
%----------------------------------------------------%
%----------------------------------------------------%
% Procedimento de preenchimento:                     %
%----------------------------------------------------%
%  (1) Esta regra � o espelho da regra Rc2. No porto p,
%   a matriz de ocupa��o B ser� preenchida por coluna, 
%   da direita para a esquerda, colocando na parte inferior da coluna. 
%   Entretanto, nesta regra as colunas ser�o preenchidas
%   at� uma altura m�xima pr�-estabelecida de acordo com
%   o n�mero de cont�ineres existentes no navio e de
%   cont�ineres a serem colocadas no mesmo no porto atual.
%
%      m ^9 6 3
%        |8 5 2 
%        |7 4 1
%      1 -----> 
%        1    n
%
%  (2) Coloca um cont�iner de cada vez, conforme
%      eles v�o sendo retirados do p�tio.
%
%  (3) Retorna a matrix que representa o navio, preenchida
%      de acordo com a regra de carregamento Rc4.
%----------------------------------------------------%
function [Navio] = Rc4_descarregamento(Navio,conteiner,altura_max) 

[linha,coluna]=size(Navio);

if  length(find(Navio(1,:)~=0)) == coluna     
    msg = 'Problema na fun��o Rc4_descarregamento !! N�o foi poss�vel carregar todos os containeres!! Espaco insufiente !! \n ';
    error(msg)
end

linha_p=1:linha;
linha_abaixo=linha_p;
p=length(linha_abaixo) - altura_max;
linha_abaixo(linha_abaixo<=p)=[];
linha_abaixo=wrev(linha_abaixo); % invertendo a ordem.
   
linha_acima=linha_p;
p=length(linha_acima) - altura_max;
linha_acima(linha_acima>p)=[];
linha_acima=wrev(linha_acima);

if length(find(Navio(linha-altura_max+1,:)~=0)) == coluna % se todas as linhas abaixo da altura m�xima estabelecida tiverem sido preenchidas, v� para as linhas de cima.
       for k = (coluna:-1:1)  %corrigindo a ordem de verifica��o.
         for i = linha_acima  
             if Navio(i,k) == 0
                Navio(i,k) = conteiner;
                conteiner=0;
                break
             end
         end
         if conteiner == 0
            break
         end
       end
    
else % se a altura m�xima ainda n�o foi atingida em todas as colunas
   % Ordem que vai percorrer
    for k = (coluna:-1:1)  %corrigindo a ordem de verifica��o.
         for i = linha_abaixo  
             if Navio(i,k) == 0
                Navio(i,k) = conteiner;            
                 conteiner=0;
                break
             end
         end
         if conteiner == 0
            break
         end
    end 
end    
end