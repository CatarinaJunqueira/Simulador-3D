% % Esta funcao emprega algoritmos geneticos para 
% % resolver o problema de alocacao de containeres
% % em navios.
% NOVIDADE:::::::  TODOS OS CONT�INERES DO PATIO SAO RETIRADOS
% % Navio  % matriz de ocupacao B, do navio. � uma matriz de zeros
% % navio  % vetor que guarda a informacao sobre qual eh o navio de destino
% %          de cada conteiner
% % porto  % vetor que guarda a informacao sobre qual eh o porto de destino
% %          de cada conteiner
% % np     % numero de portos percorridos
% % patio  % matriz de ocupacao T, do patio
% % lbound % limite inferior da quantidade de regras % lbound = 1
% % ubound % limite superior da quantidade de regras % ubound = 210
% % TESTE:
% % [patio,navio,porto,Navio,np] = gera_cenario(7,10,6,4)
% % [X,fit,tempo]=ga(Navio,navio,porto,patio,4,1,48)

function [X,fit,tempo,melhor_fitness,Melhor_Regra_Rt,Melhor_Regra_Rc,Melhor_Regra_Rd]=ga(Navio,porto,patio,np,lbound,ubound,NomeInstancia)
     tic;
  %  NomeInstancia = input('Nomeie a instancia de teste como = Instancia + Numero -> ');
     distcomp.feature( 'LocalUseMpiexec', false );
     myCluster = parcluster('local');
     myCluster.NumWorkers = 4;  % 'Modified' property now TRUE
     saveProfile(myCluster);    % 'local' profile now updated,
     parpool(4)
     % Declara��o de valores importantes e que ser�o utilizados ao longo do programa.
     elapsedtime= tic;
     POPSIZE = 10;       % Pop. Size.
     MAXGENS = 1000;      % Max number of generations.
     PXOVER = 0.8;       % Probability of crossover.
     PMUTATION = 0.15;   % Probability of mutation.    %0.15.
     generation = 0;     % Initial number of generations.
     NVARS = np - 1;     % Number of variables.
     melhores = zeros(1,MAXGENS);
     melhor_fitness= zeros(1,MAXGENS);
     melhor_regra= cell(1,MAXGENS);
     xrep=zeros(MAXGENS,3);
          
     % Chamadas as fun��es auxiliares.
     population = initialize(POPSIZE,NVARS,lbound,ubound);      
     [population,u,g] = evaluate(POPSIZE,population,Navio,porto,patio); 
     population = keep_the_best(POPSIZE,NVARS,population);
     melhores(1) = population(POPSIZE+1).fitness;
     melhor_fitness(1)=u;
     melhor_regra{1}=g;
     while (generation < MAXGENS)
       generation = generation + 1;
 %      ipopulation = select(POPSIZE,population);
       
       %------------------------------------------------%

       %------------------------------------------------%
       ipopulation = crossover(POPSIZE, PXOVER, NVARS, population);
       ipopulation = mutate(POPSIZE, NVARS, PMUTATION, ipopulation);
       population = cbelitist(POPSIZE,NVARS,ipopulation);       
       [population,u,g] = evaluate(POPSIZE,population,Navio,porto,patio);
       population = keep_the_best(POPSIZE,NVARS,population);
       melhores(generation+1) = population(POPSIZE+1).fitness;
       melhor_fitness(generation+1) =u;
       melhor_regra{generation+1}=g;
       xrep(generation,:) = report(POPSIZE, population);
  %     fprintf(1,'Geracao: %4d -> Best Fitness: %8.4f  \n',generation,1/xrep(generation,1)-1);    
        if toc > 0.001     
             fprintf('Itera��o:');
             display(generation);
             fprintf('N�mero de movimentos:');
             display(value);
             fprintf('Tempo m�ximo de execu��o de 2 horas atingido')
             continue
        end
     end
     tempo=toc(elapsedtime);
     p = gcp;
     delete(p)
      
     % Copiando informa��es das solu��es da �ltima gera��o
     % para uma matriz X.
     for i=1:POPSIZE+1
         X(i,:) = population(i).gene;
     end  
     
     % Copiando a informa��o de fitness dos individuos para
     % um vetor de fitness.
     for i=1:POPSIZE+1
       fit(i) = (1.0/(population(i).fitness)-1.0);     
     end       
     
    XREP=1./xrep(:,1)-1;
    plot(XREP)
    
    %Melhores Regras:
     [~,c]=find(melhor_fitness==min(melhor_fitness));
     Regras=zeros(3,length(c));
     j=1;
     for i=1:length(c)
         for k=1:length(melhor_regra{1,1})
             v=melhor_regra{1,c(i)};
             [Rt,Rc,Rd] = num2Rules2D(v(k));
             Regras(1,j)=Rt;
             Regras(2,j)=Rc;
             Regras(3,j)=Rd;
             j=j+1;             
         end
     end
     Melhores_Regras_Rt=unique(Regras(1,:));
     for i=1:size(Melhores_Regras_Rt,2)
         y1(i) = sum(Regras(1,:)==Melhores_Regras_Rt(i));
     end
     
     Melhores_Regras_Rc=unique(Regras(2,:));
     for i=1:size(Melhores_Regras_Rc,2)
         y2(i) = sum(Regras(2,:)==Melhores_Regras_Rc(i));
     end
     
     Melhores_Regras_Rd=unique(Regras(3,:)); 
     for i=1:size(Melhores_Regras_Rd,2)
         y3(i) = sum(Regras(3,:)==Melhores_Regras_Rd(i));
     end
        
     Melhores_Regras_Rt(2,:)=y1; %primeira linha traz o numero da regra, e a segunda traz o numero de repeticoes
     Melhores_Regras_Rc(2,:)=y2;
     Melhores_Regras_Rd(2,:)=y3;
     
     Max=max(Melhores_Regras_Rt(2,:)); % Melhor regra de retirada do patio
     [~,col]=find(Melhores_Regras_Rt(2,:)==Max);
     Melhor_Regra_Rt=Melhores_Regras_Rt(1,col);
     
     Max=max(Melhores_Regras_Rc(2,:));
     [~,col]=find(Melhores_Regras_Rc(2,:)==Max);
     Melhor_Regra_Rc=Melhores_Regras_Rc(1,col);
     
     Max=max(Melhores_Regras_Rd(2,:));
     [~,col]=find(Melhores_Regras_Rd(2,:)==Max);
     Melhor_Regra_Rd=Melhores_Regras_Rd(1,col);
     
     melhor_fitness=min(fit);
     display(melhor_fitness)
     
     NomeInstancia=strcat('Resultados-',NomeInstancia,'.mat');
     save(NomeInstancia, 'X','fit','melhor_fitness','Melhor_Regra_Rt','Melhor_Regra_Rc','Melhor_Regra_Rd','tempo');
end
     