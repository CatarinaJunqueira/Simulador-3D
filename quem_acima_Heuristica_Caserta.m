function acima = quem_acima_Heuristica_Caserta(P,n) %Quem est� acima que n�o � vazio.
       % R=P(:,col_n);
       % R=R(R~=0 & R~=n); % conjunto dos cont�ineres que est�o acima de n
[linha,coluna] = find(P==n);
c_lista = 1;  %come�o na posi��o 1.
b=sum(P(:,coluna) ~= 0);
acima=zeros(b-1,1);

for a_cont = (1:linha-1) 
    if (P(a_cont,coluna) ~= 0)  %verificando se tem espaco vazio na altura
       acima(c_lista,1) = P(a_cont,coluna);
       c_lista = c_lista + 1;  % Depois que insiro na posi��o 1, passo p/ a pr�xima. Mover na lista.
    end
end
T=acima(:,1);
[row]=find(T==0);
acima(row,:)=[];
    
end      