
% Nome: Regra de Retirada - Rt 

%---------------------------------------------------------------------%
%                  Regra de Retirada do P�tio (Rt)      %
%---------------------------------------------------------------------%

% Par�metros de entrada: P�tio, Navio e M�trica (n�mero da regra a ser utilizada)
% patio=[0,0,0,0,0;0,0,15,16,0;11,12,13,14,0;6,7,8,9,10;1,2,3,4,5];
% navio=[3,1,5,1,1,1,4,4,1,5,1,5,5,3,3,4];
% porto=[5,2,5,2,2,2,3,4,2,5,4,5,4,3,3,4];
% RegraRetirada=1; % n�mero da regra de retirada do p�tio
% Navio=zeros(5,5);
% RegraCarregamento=1; % n�mero da regra de carregamento no navio
% [MovGeral,tempo,DistanciaTotal,Navio] = Rt(patio,navio,RegraRetirada,Navio,RegraCarregamento)

function [MovGeral,Navio] = Rt(patio,RegraRetirada,Navio,RegraCarregamento,porto)

MovGeral=0;
    
switch RegraRetirada
    case 7
           [mov_total,Navio] = Rt7(patio,Navio,RegraCarregamento,porto);
           MovGeral=MovGeral+mov_total;
    case 8
           [mov_total,Navio] = Rt8(patio,Navio,RegraCarregamento,porto);
           MovGeral=MovGeral+mov_total;
    case 9
           [mov_total,Navio] = Rt9(patio,Navio,RegraCarregamento,porto);
           MovGeral=MovGeral+mov_total;
    case 10
           [mov_total,Navio] = Rt10(patio,Navio,RegraCarregamento,porto);
           MovGeral=MovGeral+mov_total;
    otherwise
        %----------------------------------%
        % identificando a regra que vai ser utilizada (qual localiza e qual vazio) 
        %localiza = strcat('encontra',int2str(i));
        vzio = strcat('desguarnecido',int2str(RegraRetirada));
        %----------------------------------%

        [l_navio] = encontraCaserta(patio); % Chamando o localiza, traz uma lista das posi��es dos cont�ineres que v�o ser retirados.

        [mov_total,Navio] = mover_Novo_Genetico(patio,l_navio,vzio,RegraCarregamento,Navio,porto);
        MovGeral=MovGeral+mov_total;
end
  
% %     if RegraRetirada ~= 7 && RegraRetirada ~= 8
% %         %----------------------------------%
% %         % identificando a regra que vai ser utilizada (qual localiza e qual vazio) 
% %         %localiza = strcat('encontra',int2str(i));
% %         vzio = strcat('desguarnecido',int2str(RegraRetirada));
% %         %----------------------------------%
% % 
% %         [l_navio] = encontraCaserta(patio); % Chamando o localiza, traz uma lista das posi��es dos cont�ineres que v�o ser retirados.
% % 
% %         [mov_total,Navio] = mover_Novo_Genetico(patio,l_navio,vzio,RegraCarregamento,Navio);
% %         MovGeral=MovGeral+mov_total;
% %     end
% %     
% %          if RegraRetirada == 7
% %            [mov_total,Navio] = Rt7(patio,Navio,RegraCarregamento);
% %            MovGeral=MovGeral+mov_total;
% %          end
% % 
% %           if RegraRetirada == 8
% %            [mov_total,Navio] = Rt8(patio,Navio,RegraCarregamento);
% %            MovGeral=MovGeral+mov_total;
% %           end
% %          
% %          if RegraRetirada == 9
% %            [mov_total,Navio] = Rt8(patio,Navio,RegraCarregamento);
% %            MovGeral=MovGeral+mov_total;
% %          end

end  