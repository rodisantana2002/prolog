exibe([]) :- nl.
exibe([X|Y]) :- 
	write(X), nl, 
  	exibe(Y).
  	
%membro(X,L) : o item X é membro da lista L
membro(X,[X|_]).
membro(X,[_|Y]) :- membro(X,Y).
  
% anexa(A,B,C): A anexado com B dá C
anexa([], B, B).
anexa([X|A], B, [X|C]) :- anexa(A, B, C).

% distribui(L,A,B) : distribui itens de L entre A e B
distribui([],[],[]).
distribui([X],[X],[]). distribui([X,Y|Z],[X|A],[Y|B]) :- distribui(Z,A,B).

% intercala(A,B,L) : intercala A e B gerando L
intercala([],B,B). intercala(A,[],A). intercala([X|A],[Y|B],[X|C]) :- X =< Y,
intercala(A,[Y|B],C). intercala([X|A],[Y|B],[Y|C]) :- X > Y, intercala([X|A],B,C).

% ordena(L,S) : ordena a lista L obtendo S ordena([],[]).
ordena([X],[X]).
ordena([X,Y|Z],S) :-
  distribui([X,Y|Z],A,B),
  ordena(A,As),
  ordena(B,Bs),
  intercala(As,Bs,S).
  
isOrdered([]).
isOrdered([_]).
isOrdered([X,Y|XYs]):-X=<Y,isOrdered([Y|XYs]).

maxL([X],X).
maxL([X|Xs],X):-maxL(Xs,M),X >M.
maxL([X|Xs],M):-maxL(Xs,M),X=<M.
maxL([X],X).
maxL([X|Xs],M):-maxL(Xs,M1),(X>M1,M=X; X=<M1,M=M1).

lista_rand([],V,N):-N<1,V=V,!.
lista_rand([R|L],V,N):-
	N1 is N-1, 
	R is random(V), 
	lista_rand(L,V,N1).

mostra(Z1,Z2) :- lista_rand(L, Z1, Z2), ordena(L, X), write(X).