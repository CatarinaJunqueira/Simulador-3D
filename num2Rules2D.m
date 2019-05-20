
function [RegraRetirada,RegraCarregamento,RegraDescarregamento] = num2Rules2D(valor)

    retirada = 10;
    carregamento = 7;
    descarregamento = 3;
    
    contador = 0;
    metrica = 1;
    
    comb = (retirada * carregamento * descarregamento);

    if (valor > comb)
%        msg='Erro na fun��o num2Rules2D. Favor inserir at�';
%        display(comb);
%        display('Regra(s)');
       error('Erro na fun��o num2Rules2D. Favor inserir at� 180 regras');
    else

        for l_rt = (1:valor)
            
            if (contador == (carregamento * descarregamento))
                
                metrica = metrica + 1;
                
                contador = 0;                
            end  
            
            contador = contador +1;

        end
        RegraRetirada=metrica;
        contador = 0;
        metrica = 1;
           
        for l_fre = (1:valor)
            
            contador = contador +1;
            
            if (contador == descarregamento+1)
                
                metrica = metrica + 1;
                
                if (metrica == carregamento + 1)
                    
                    metrica = 1;
                    
                end
                
                contador = 1;                
            end                
        end
        
        RegraCarregamento=metrica;
        metrica = 0;
        
        for l_frs = (1:valor)
             
          metrica = metrica +1;
            
            if (metrica == descarregamento + 1)
                
                metrica = 1;
            end  
                  
        end
        
        RegraDescarregamento = metrica;

    end
end