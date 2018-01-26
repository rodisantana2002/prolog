lista_rand([],V,N):-N<1,V=V,!.
lista_rand([R|L],V,N):-
	N1 is N-1, 
	R is random(V), 
	lista_rand(L,V,N1).
	
mostra :- ordena(lista_rand(L,100, 5), L).

ligado(a,b,5).
ligado(a,c,10).
ligado(a,g,75).
ligado(c,d,10).
ligado(d,g,15).
ligado(d,e,5).
ligado(g,f,20).
ligado(e,f,5).
ligado(b,f,25).
ligado(b,e,5).
ligado(d,f,25).

% anexa(A,B,C): A anexado com B dá C
anexa([], B, B).
anexa([X|A], B, [X|C]) :- anexa(A, B, C).

rota(X,Y,Km) :- ligado(X,Y,Km).
rota(X,Y,Km) :- ligado(X,Z,C1),         
	rota(Z,Y,C2),
	Km is C1 + C2.
