
a=1;
while a<28
    for i=1:3
         for j=1:3       
             NomeInstancia=strcat('Instancia3D-',int2str(a),'-Tipo-',int2str(i),'-Ocupacao-',int2str(j),'.mat');  
             display(NomeInstancia);
             a=a+1;
             load(NomeInstancia)
             ubound=210;
             
             [num_patios,~]=size(patio);
             yard=cell(num_patios,1);
             for um=1:num_patios
                 % [linha,coluna]=size(patio{um,1});
                  Min=min(patio{um,1}(patio{um,1}>0));
                  Max=max(max(patio{um,1}));
                  AA=zeros(1,Max-Min +1);
                  AA( end+1, : ) = linspace(Min,Max,Max-Min +1); 
                  yard{um,1}=AA;
             end
    
             [X,fit,tempo,melhor_fitness,Melhor_Regra_Rt,Melhor_Regra_Rc,Melhor_Regra_Rd]=ga(Navio,porto,yard,np,lbound,ubound,NomeInstancia);
             ResultadoInstancia=strcat('ResultadoFlat-','NomeInstancia','.mat');
             save(ResultadoInstancia,'ResultadoInstancia','X','fit','tempo','melhor_fitness','Melhor_Regra_Rt','Melhor_Regra_Rc','Melhor_Regra_Rd');
         end
    end
end

