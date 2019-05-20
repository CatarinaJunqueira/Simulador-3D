function l_patio = gera_patio3()

%5000 cont�ineres

	x = 10;                % Defini��o do n�mero de linhas da matriz.
	y = 20;             % Defini��o do n�mero de colunas da matriz.
	l_patio = zeros(x,y);  % Defini��o do tamanho do p�tio.
	A = 6;                % N�mero do �ltimo navio
	B = 1;                % N�mero do primeiro navio (Para gerar valores entre 1 e 5)
	%C = 6;                % N�mero do �ltimo porto + 1
	%D = 3;               % N�mero do primeiro porto
	zero_navio = {l_patio(1),(2)};
	
%CASO 2  - define quantos por coluna 
	for coluna = (1:y) 
		%Definicao de tamanho da coluna vazia
		%Feito para cada coluna - logo, dentro do for
		aux = 0;
		p_vazio = rand();
		if (p_vazio < 0.000001)
			vazios = floor((5-1).*rand(1) + 1)
			%pode ser inteiro vazio
        else
			vazios = floor((round(x/2)-1).*rand(1) + 1)
			%pelo menos metade estara ocupado
		
		for linha = (1:x)    
			if (aux >= vazios)
			l_patio(linha,coluna)= randi(A,size(y))
            else
			l_patio(linha,coluna)= (0);
			aux = aux + 1;
            end
		end  
	end
%Fim caso 2
% ----------------------------------------------------------------------
end