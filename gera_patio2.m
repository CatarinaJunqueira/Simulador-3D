function l_patio = gera_patio2()


	x = 10;                % Defini��o do n�mero de linhas da matriz.
	y = 10;             % Defini��o do n�mero de colunas da matriz.
	l_patio = cell(x,y);  % Defini��o do tamanho do p�tio.
	A = 18;                % N�mero do �ltimo navio
	B = 1;                % N�mero do primeiro navio (Para gerar valores entre 1 e 5)
	C = 11;               % N�mero do �ltimo porto + 1
	D = 10;                % N�mero do primeiro porto
	zero_navio = {l_patio(1),(2)};
	
%CASO 2  - define quantos por coluna 
	for coluna = (1:y)
        
			vazios = floor((round(x/2)-1).*rand(1) + 1);
			%pelo menos metade estara ocupado
		
		for linha = (1:x)    
			
			l_patio(linha,coluna)= {[floor((A-B).*rand(1) + B), floor((C-D).*rand(1) + D)]};
        end
    end  
	
%Fim caso 2
% ----------------------------------------------------------------------
end