%----------------------------------------------------%
%----------------------------------------------------%
% Elabora��o da Regra R2 de Carregamento.            %
%----------------------------------------------------%
%----------------------------------------------------%
% Procedimento de preenchimento:                     %
%----------------------------------------------------%
%  (1) Considera-se que a ordem de preenchimento
%      das cargas no navios ->, por coluna, come�ando
%      de baixo para cima, da esquerda para a direita.  
%      Entretanto, nesta regra as colunas ser�o 
%      preenchidas at� uma altura m�xima pr�-estabelecida
%      de acordo com o n�mero de cont�ineres existentes 
%      no navio e de cont�ineres a serem colocadas no
%      mesmo no porto atual. 
%
%      m ^
%        |2 4 6
%        |1 3 5
%      1 -----> 
%        1    n
%
%  (2) Coloca um cont�iner de cada vez, conforme
%      eles v�o sendo retirados do p�tio.
%
%  (3) Retorna a matrix que representa o navio, preenchida
%      de acordo com a regra de carregamento Rc2.
%----------------------------------------------------%
function [Navio] = Rc2(Navio,conteiner,altura_max) 

% [linha,coluna]=size(Navio);
% 
% if  length(find(Navio(1,:)~=0)) == coluna 
%     msg = 'Problema na fun��o Rc2 !! N�o foi poss�vel carregar todos os containeres!! Espaco insufiente !! \n ';
%     error(msg)  
% end


for t=1:size(Navio,2) % de 1 ateh o numero de baias

    Nv=Navio{1,t};
    [linha,coluna]=size(Nv);

    linha_p=1:linha;
    linha_abaixo=linha_p;
    p=length(linha_abaixo) - altura_max(1,t);
    linha_abaixo(linha_abaixo<=p)=[];
    linha_abaixo=wrev(linha_abaixo); % invertendo a ordem.

    linha_acima=linha_p;
    p=length(linha_acima) - altura_max(1,t);
    linha_acima(linha_acima>p)=[];
    linha_acima=wrev(linha_acima);


    if length(find(Nv(linha-altura_max(1,t)+1,:)~=0)) == coluna % se todas as linhas abaixo da altura m�xima estabelecida tiverem sido preenchidas, v� para as linhas de cima.
           for k = 1:coluna %corrigindo a ordem de verifica��o.
             for i = linha_acima  
                 if Nv(i,k) == 0
                    Nv(i,k) = conteiner;
                     conteiner=0;
                    break
                 end
             end
                 if conteiner == 0
                    Navio{1,t}=Nv; 
                    break
                 end
           end

    else % se a altura m�xima ainda n�o foi atingida em todas as colunas
       % Ordem que vai percorrer
        for k = 1:coluna %corrigindo a ordem de verifica��o.
             for i = linha_abaixo  
                 if Nv(i,k) == 0
                    Nv(i,k) = conteiner;
                     conteiner=0;
                    break
                 end
             end
             if conteiner == 0
                Navio{1,t}=Nv;
                break
             end
        end
             if conteiner == 0
                break
             end
    end
             if conteiner == 0
                break
             end

end

end