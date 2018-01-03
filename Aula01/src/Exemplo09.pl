exibe([]) :- nl.
exibe([X|Y]) :- 
	write(X), nl, 
  	exibe(Y).
  	
pertence(Elem, [Elem|_]).
pertence(Elem, [_|Cauda]) :- 
	pertence(Elem, Cauda).

obter_primeiro(Elem, [Elem|_]):-!.

obter_ultimo([Elem], Elem).
obter_ultimo([_|Cauda], Elem) :- 
	ultimo(Cauda, Elem).

consecutivos(Elem1, Elem2, [Elem1, Elem2|_]).
consecutivos(Elem1, Elem2, [_|Cauda]) :- 
	consecutivos(Elem1, Elem2, Cauda).

count([], 0).
count([_|Cauda], N) :- 
	count(Cauda, N1),
	N is N1 + 1.
	
max([Elem], Elem).
max([Elem,Y|Cauda], Max) :- 
	Elem >= Y, 
	!,
	max([Elem|Cauda], Max).
max([_,Y|Cauda], Max) :- max([Y|Cauda],Max).	

min([Elem], Elem).
min([Elem,Y|Cauda], Min) :- 
	Elem =< Y, 
	!,
	min([Elem|Cauda], Min).
min([_,Y|Cauda], Min) :- max([Y|Cauda], Min).	

soma([], 0).
soma([Elem|Cauda], S) :- 
	soma(Cauda, S1), 
	S is S1 + Elem.

obter_by_index(1, Elem, [Elem|_]).
obter_by_index(N, Elem, [_|Cauda]) :- 
	obter_by_index(M, Elem, Cauda), 	
	N is M + 1.

obter_sublista_by_index([], _, []).
obter_sublista_by_index([Cabeca|Cauda], L, [X|Y]) :- 
	find_by_index(Cabeca, X, L),
	obter_sublista_by_index(Cauda, L, Y).

remover_elemento(_,[],[]).
remover_elemento(Elem, [Elem|Cauda], L) :- 
	remover_elemento(Elem, Cauda, L).
remover_elemento(Elem, [Elem1|Cauda], [Elem1|Cauda1]) :-
	Elem \== Elem1,
	remover_elemento(Elem, Cauda, Cauda1).

inserir_inicio(Elem, Lista, [Elem|Lista]).
			
inserir_final([], Elem, [Elem]).         
inserir_final([Cabeca|Cauda], Elem, [Cabeca|Cauda1]) :- 
    inserir_final(Cauda, Elem, Cauda1).  	
    
alterar_elemento(_,_, [], []).
alterar_elemento(Elem_sai,Elem_entra, [Elem_sai|Cauda], [Elem_entra|Cauda1]) :-
	alterar_elemento(Elem_sai, Elem_entra,Cauda,Cauda1).
alterar_elemento(Elem_sai,Elem_entra, [Elem_sai1|Cauda], [Elem_sai1|Cauda1]) :-
	Elem_sai \== Elem_sai1, 
	alterar_elemento(Elem_sai, Elem_entra,Cauda,Cauda1).
	
	
concatenar([], Lista, Lista).
concatenar([Elem|Lista1], Lista2, [Elem|Lista3]) :-
	concatenar(Lista1, Lista2, Lista3).
	
inverter(Lista, Lista_inv) :- invert(Lista, [], Lista_inv).
invert([], Lista, Lista).
invert([Elem|Cauda], Lista_int, Lista_inv) :- invert(Cauda, [Elem|Lista_int], Lista_inv).    

comparar_listas([],[]).
comparar_listas([Cabeca|Cauda], Cauda1) :- 
	remover(Cabeca, Cauda1, Cauda3),
	comparar_listas(Cauda, Cauda3).
remover_aux(X, [X|Y],Y).
remover_aux(X, [_|Cauda], [_|Cauda1]) :- 
	remover(X, Cauda, Cauda1).
    