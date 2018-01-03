/*
Cab  - cabeça da lista
Cau  - Cauda dalista
Elem - Elemento da lista
*/

exibe([]) :- nl.
exibe([X|Y]) :- 
	write(X), nl, 
  	exibe(Y).
  	
pertence(Elem, [Elem|_]).
pertence(Elem, [_|Cau]) :- 
	pertence(Elem, Cau).

obter_primeiro(Elem, [Elem|_]):-!.

obter_ultimo([Elem], Elem).
obter_ultimo([_|Cau], Elem) :- 
	ultimo(Cau, Elem).

consecutivos(Elem1, Elem2, [Elem1, Elem2|_]).
consecutivos(Elem1, Elem2, [_|Cau]) :- 
	consecutivos(Elem1, Elem2, Cau).

count([], 0).
count([_|Cau], N) :- 
	count(Cau, N1),
	N is N1 + 1.
	
max([Elem], Elem).
max([Elem,Y|Cau], Max) :- 
	Elem >= Y, 
	!,
	max([Elem|Cau], Max).
max([_,Y|Cau], Max) :- max([Y|Cau],Max).	

min([Elem], Elem).
min([Elem,Y|Cau], Min) :- 
	Elem =< Y, 
	!,
	min([Elem|Cau], Min).
min([_,Y|Cau], Min) :- max([Y|Cau], Min).	

soma([], 0).
soma([Elem|Cau], S) :- 
	soma(Cau, S1), 
	S is S1 + Elem.

obter_by_index(1, Elem, [Elem|_]).
obter_by_index(N, Elem, [_|Cau]) :- 
	obter_by_index(M, Elem, Cau), 	
	N is M + 1.

obter_sublista_by_index([], _, []).
obter_sublista_by_index([Cab|Cau], L, [X|Y]) :- 
	find_by_index(Cab, X, L),
	obter_sublista_by_index(Cau, L, Y).

remover_elemento(_,[],[]).
remover_elemento(Elem, [Elem|Cau], L) :- 
	remover_elemento(Elem, Cau, L).
remover_elemento(Elem, [Elem1|Cau], [Elem1|Cau1]) :-
	Elem \== Elem1,
	remover_elemento(Elem, Cau, Cau1).

inserir_inicio(Elem, Lista, [Elem|Lista]).
			
inserir_final([], Elem, [Elem]).         
inserir_final([Cab|Cau], Elem, [Cab|Cau1]) :- 
    inserir_final(Cau, Elem, Cau1).  	
    
alterar_elemento(_,_, [], []).
alterar_elemento(Elem_sai,Elem_entra, [Elem_sai|Cau], [Elem_entra|Cau1]) :-
	alterar_elemento(Elem_sai, Elem_entra,Cau,Cau1).
alterar_elemento(Elem_sai,Elem_entra, [Elem_sai1|Cau], [Elem_sai1|Cau1]) :-
	Elem_sai \== Elem_sai1, 
	alterar_elemento(Elem_sai, Elem_entra,Cau,Cau1).
	
	
concatenar([], Lista, Lista).
concatenar([Elem|Lista1], Lista2, [Elem|Lista3]) :-
	concatenar(Lista1, Lista2, Lista3).
	
inverter(Lista, Lista_inv) :- invert(Lista, [], Lista_inv).
invert([], Lista, Lista).
invert([Elem|Cau], Lista_int, Lista_inv) :- invert(Cau, [Elem|Lista_int], Lista_inv).    


comparar_listas([],[]).
comparar_listas([Cab|Cau], Cau1) :- 
	remover_aux(Cab, Cau1, Cau3),
	comparar_listas(Cau, Cau3).
remover_aux(X, [X|Y],Y).
remover_aux(X, [_|Cau], [_|Cau1]) :- 
	remover_aux(X, Cau, Cau1).
    
encontrar_iguais([], _, []).
encontrar_iguais([Cab|Cau], L, [Cab|U]) :- 
	pertence(Cab, L),
	!,
	encontrar_iguais(Cau, L, U).
encontrar_iguais([_|Cau], L, U) :-
	encontrar_iguais(Cau, L, U).	

encontrar_diffs(Lista1, Lista2, Result) :-
	findall(X, (pertence(X,Lista1), not(pertence(X, Lista2))), Result1),
	findall(Y, (pertence(Y,Lista2), not(pertence(Y, Lista1))), Result2),	
	concatenar(Result1, Result2, Result).
	    