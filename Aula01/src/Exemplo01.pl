/* Aqui começa o programa ... */
pessoa(ale).
pessoa(babe).
pessoa(rosa).
cor(azul).
cor(amarelo).
cor(vermelho).
cor(lilaz).
cor(verde).
/* Alexandra */
/* Barbara */
/* este pedaço é importante... pois.... está
dito no problema e define uma cor para cada
moça */
tem_uma_cor(babe,amarelo).
tem_uma_cor(rosa,verde).
tem_uma_cor(ale,azul).
/* aqui pode-se ampliar as restrições */
nao_pode_vestir(babe,verde).
nao_pode_vestir(rosa,azul).
nao_pode_vestir(rosa,lilaz).
nao_pode_vestir(rosa,amarelo).
veste(X, Cor1, Cor2) :-
    pessoa(X),
    cor(Cor1),
    cor(Cor2),
    tem_uma_cor(X,Cor1), \+ (nao_pode_vestir(X,Cor2)) , Cor1 \== Cor2, \+ (
    ((Cor1 = vermelho), (Cor2 = amarelo)); ((Cor1 = amarelo), (Cor2 = vermelho))).
	    
ache_tudo :-
    veste(X,C1,C2),
    write(X),
    write('   ====> '), write(C1),
    write('.... e ....'), write(C2),
    nl,
    fail.	    
    
    
mostrar([X|Cau]) :-
	write('Cabeça'), write([X]), nl,
	write('Cauda'), write([Cau]).    