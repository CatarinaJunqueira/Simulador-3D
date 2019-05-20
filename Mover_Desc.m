
function [mov_total,patio,Navio] = Mover_Desc(patio,l_navio,~,Navio,RegraCarregamento)

qtd_cont = length(l_navio); %quantidade de cont�ineres que v�o sair
mov_total = 0;  %gerando dados iniciais
qtde_topo = 1;

%-------------------------------------------------------------%
% identificando a regra de carregamento que vai ser utilizada % 
Rc = strcat('Rc',int2str(RegraCarregamento),'_descarregamento');

if (RegraCarregamento == 2) || (RegraCarregamento == 4) % se a regra Rc � a Rc2 ou a Rc4
   [~,n]=size(Navio);
   altura_max = ceil((length(l_navio) + length(find(Navio ~= 0)))/n);
end
%-------------------------------------------------------------%

%----------------------------------------------------------------------------------------------------------------------------------------------%
% Primeiro verifica-se se existem cont�ineres que est�o na lista l_navio que est�o no topo de suas filas e podem ser retirados sem remanejamento 

     while (qtde_topo > 0)  % Enquanto ainda existirem cont�ineres no p�tio que s�o topo
         qtde_topo = 0; % Condi��o de parada: topo = 0         
         
          for n_cont = (1:qtd_cont)   
            if (l_navio(n_cont) ~= 0)
                [bool] = topo(patio,l_navio(n_cont,:)); % verifica se eh topo ou nao

                if (bool == 1) % Est� no topo(1), ou seja, n�o � necess�rio mais que uma movimentacao de conteiner

                   [patio,conteiner] = remover(patio,l_navio(n_cont,:)); %tira do patio
                   
                   l_navio(n_cont,:)=0; %transforma o valor em 0, indica que ja foi visto

                   mov_total = mov_total + 1; %Soma o custo da movimentacao total
                          
                   if (RegraCarregamento == 2) || (RegraCarregamento == 4)
                       [Navio] = feval(Rc,Navio,conteiner,altura_max); %chamando a regra de carregamento no navio
                   else
                       [Navio] = feval(Rc,Navio,conteiner); %chamando a regra de carregamento no navio                       
                   end

                   mov_total = mov_total + 1; %Soma o custo da movimentacao total

                   qtde_topo = qtde_topo + 1; %soma o contador de topo, para passar aqui de novo

                end
            end               
          end                           
     end
end