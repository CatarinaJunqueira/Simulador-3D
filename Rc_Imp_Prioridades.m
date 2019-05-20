%----------------------------------------------------%
%----------------------------------------------------%
% Elabora��o da Regra Rc_Imp de Carregamento.            %
%----------------------------------------------------%
%----------------------------------------------------%
% Procedimento de preenchimento:   % 
%----------------------------------------------------%
%
% Prioridade =  0, se a coluna est� cheia;
%                    N+1, se a coluna est� vazia;
%                    min(n), caso contr�rio.
%                     
% procedimento de preenchimento utilizando prioridades,
% para tentar colocar os conteineres no patio de transbordo
% de forma que o numero de remanejamentos quando forem 
% retirados seja minimizado. (nao colocar uma prioridade 
% maior em cima de uma prioridade menor).
%----------------------------------------------------%
function [Patio_Transb] = Rc_Imp_Prioridades(Patio_Transb,conteiner) 

[linha,coluna]=size(Patio_Transb);

if unique(Patio_Transb) ==0
   Patio_Transb(linha,1) = conteiner;
else

    if  length(find(Patio_Transb(1,:)~=0)) == coluna     
        msg = 'Problema na fun��o Rc_Imp !! N�o foi poss�vel carregar todos os containeres!! Espaco insufiente !! \n ';
        error(msg)
    end

    prioridade=zeros(1,coluna); % criando a lista de prioridades 
    N=max(max(Patio_Transb));

    for j=1:coluna %Para j de 1 ateh o n�mero de colunas.   
        if nnz(Patio_Transb(:,j))==0 % se a coluna est� vazia, entao a prioridade eh igual � maior prioridade encontrada no p�tio + 1
          prioridade(1,j)=N+1;
          continue
        end
        TF=isempty(find(Patio_Transb(:,j)==0, 1)); % verifica se tem alguma posicao vazia na coluna j
        if TF==0  % s� me�o a prioridade das colunas n�o cheias 
           X=Patio_Transb(:,j);    
           x=min(X(X>0));
           prioridade(1,j)=x; % valor do menor cont�iner da coluna k
        end
    end
    %Termina de encontrar as prioridades de cada coluna
    %---------------------------------------------------------------------------
    min_i=sort(prioridade);
    max_i=max(prioridade);
    marcador=1;
    for h=1:coluna
        if min_i(h)>conteiner && min_i(h)~=0 % se satisfeita a condi��o, ent�o colocar o conteiner nessa coluna n�o vai gerar nenhum movimento adicional.
           [~,col] = find(prioridade==min_i(h));
           col=col(1);
           [row]=find(Patio_Transb(:,col)==0);
           lin=row(end);
           Patio_Transb(lin,col) = conteiner; 
           marcador=0;
           break
        end 
    end

    if marcador==1 % caso em que nenhuma das prioridades eh maior do que 'conteiner'. Escolher a menos pior. 
        [~,col] = find(prioridade==max_i);
        col=col(1);
        [row]=find(Patio_Transb(:,col)==0);
        lin=row(end);
        Patio_Transb(lin,col) = conteiner; 
    end


end

end
