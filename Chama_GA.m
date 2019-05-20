
a=1;
while a<28
    for i=1:3
         for j=1:3       
             NomeInstancia=strcat('Instancia3D-',int2str(a),'-Tipo-',int2str(i),'-Ocupacao-',int2str(j),'.mat');  
             display(NomeInstancia);
             a=a+1;
             load(NomeInstancia)
             [X,fit,tempo,melhor_fitness,Melhor_Regra_Rt,Melhor_Regra_Rc,Melhor_Regra_Rd]=ga(Navio,porto,patio,np,lbound,ubound,NomeInstancia);
             ResultadoInstancia=strcat('Resultado-','NomeInstancia','.mat');
             save(ResultadoInstancia,'ResultadoInstancia','X','fit','tempo','melhor_fitness','Melhor_Regra_Rt','Melhor_Regra_Rc','Melhor_Regra_Rd');
         end
    end
end


% tempo=toc;
% fprintf('Tempo de execucao:');
% display(toc);
% fprintf('Número de movimentos:');
% display(value);

