/*
Cab  - cabeça da lista
Cau  - Cauda dalista
Elem - Elemento da lista
--------------------------
modo - forma de chamada do programa
<arg-i> = + sempre deve ser instanciado
<arg-i> = - deve ser uma variavel livre
<arg-i> = ? pode ser valor instanciado ou variavel livre
-----------------
ex: modo(+,-)

*/

%modo(+)
imprime([]) :- !.
imprime([X|Y]) :-
	write(X), nl, 
  	imprime(Y).
  	
%modo(?,+)  	
pertence(Elem, [Elem|_]).
pertence(Elem, [_|Cau]) :- 
	pertence(Elem, Cau).
	
%modo(?,+)
obter_primeiro(Elem, [Elem|_]):-!.

%modo(+,?)
obter_ultimo([Elem], Elem).
obter_ultimo([_|Cau], Elem) :- 
	ultimo(Cau, Elem).

%modo(?,?,+)
consecutivos(Elem1, Elem2, [Elem1, Elem2|_]).
consecutivos(Elem1, Elem2, [_|Cau]) :- 
	consecutivos(Elem1, Elem2, Cau).

%modo(+,?)
count([], 0).
count([_|Cau], N) :- 
	count(Cau, N1),
	N is N1 + 1.
	
%modo(+,?)
max([], 0).	
max([Elem], Elem).
max([Elem, Y|Cau], Max) :- 
	Elem >= Y, 
	!,
	max([Elem|Cau], Max).
max([_, Y|Cau], Max) :- max([Y|Cau], Max).	

%modo(+,?)
min([], 0).
min([Elem], Elem).
min([Elem, Y|Cau], Min) :- 
	Elem =< Y, 
	!,
	min([Elem|Cau], Min).
min([_, Y|Cau], Min) :- min([Y|Cau], Min).	

%modo(+,?)
soma([], 0).
soma([Elem|Cau], S) :- 
	soma(Cau, S1), 
	S is S1 + Elem.
	
%modo(+,+)	
maior(X, Y) :- 
	X>Y.

%modo(?,?,+)
obter_by_index(1, Elem, [Elem|_]).
obter_by_index(N, Elem, [_|Cau]) :- 
	obter_by_index(M, Elem, Cau), 	
	N is M + 1.

%modo(+,+,?)
obter_sublista_by_index([], _, []).
obter_sublista_by_index([Cab|Cau], L, [X|Y]) :- 
	obter_by_index(Cab, X, L),
	obter_sublista_by_index(Cau, L, Y).

%modo(?,+?) ou modo(+,?+)
remover_elemento(Elem, [Elem|Cau], Cau).
remover_elemento(Elem, [Elem1|Cau], [Elem1|Cau1]) :- 
	remover_elemento(Elem, Cau, Cau1).

%modo(+,+,?)	
remover_all_elementos(_, [], []).
remover_all_elementos(Elem, [Elem|Cau], L) :- 
	remover_all_elementos(Elem, Cau, L).
remover_all_elementos(Elem, [Elem1|Cau], [Elem1|Cau1]) :-
	Elem \== Elem1,
	remover_all_elementos(Elem, Cau, Cau1).

%modo(+,?)
remover_duplicados([], []).
remover_duplicados([Elem|Cau], [Elem|Cau1]):-
	remover_all_elementos(Elem, Cau, Lista),
	remover_duplicados(Lista, Cau1).

%modo(?,?,?)
inserir_inicio(Elem, Lista, [Elem|Lista]).

%modo(+,+,?)			
inserir_final([], Elem, [Elem]).         
inserir_final([Cab|Cau], Elem, [Cab|Cau1]) :- 
    inserir_final(Cau, Elem, Cau1).  	

%modo(?,?,+) ou modo(+,+,?)
inserir_aleatoriamente(Elem, Lista, Lista1) :- 
	remover_elemento(Elem, Lista1, Lista).  

%mod(+, +, -)
inserir(X,[Y|CauOrd1], [Y|CauOrd2]) :-
	maior(X, Y),
	!,
	inserir(X, CauOrd1, CauOrd2).
inserir(X, CauOrd, [X|CauOrd]).		

%modo(?,?,+,?)   
alterar_elemento(_, _, [], []).
alterar_elemento(Elem_sai,Elem_entra, [Elem_sai|Cau], [Elem_entra|Cau1]) :-
	alterar_elemento(Elem_sai, Elem_entra, Cau, Cau1).
alterar_elemento(Elem_sai, Elem_entra, [Elem_sai1|Cau], [Elem_sai1|Cau1]) :-
	Elem_sai \== Elem_sai1, 
	alterar_elemento(Elem_sai, Elem_entra, Cau, Cau1).

%modo(+,-)
permutar_listas([], []).
permutar_listas([Elem|Cau], Lista) :- 
	permutar_listas(Cau, Cau1),
	inserir_aleatoriamente(Elem, Cau1, Lista).
	
%modo(?,?,+) ou modo(+,?,?)
concatenar([], Lista, Lista).
concatenar([Elem|Lista1], Lista2, [Elem|Lista3]) :-
	concatenar(Lista1, Lista2, Lista3).

particionar(_, [], [], []).
particionar(X, [Y|Cau], [Y|Menor], Maior) :-
	maior(X, Y),
	!,
	particionar(X, Cau, Menor, Maior).
particionar(X, [Y|Cau], Menor, [Y|Maior]) :-
	particionar(X, Cau, Menor, Maior).
		
%modo(?,+)
inverter(Lista, Lista_inv) :- invert(Lista, [], Lista_inv).
invert([], Lista, Lista).
invert([Elem|Cau], Lista_int, Lista_inv) :- invert(Cau, [Elem|Lista_int], Lista_inv).    


%modo(+,+)
comparar_listas([], []).
comparar_listas([Cab|Cau], Cau1) :- 
	remover_aux(Cab, Cau1, Cau3),
	comparar_listas(Cau, Cau3).	
remover_aux(X, [X|Y], Y).
remover_aux(X, [_|Cau], [_|Cau1]) :- 
	remover_aux(X, Cau, Cau1).


%modo(+,+,?)    
encontrar_iguais([], _, []).
encontrar_iguais([Cab|Cau], L, [Cab|U]) :- 
	pertence(Cab, L),
	!,
	encontrar_iguais(Cau, L, U).
encontrar_iguais([_|Cau], L, U) :-
	encontrar_iguais(Cau, L, U).	

%modo(+,+,?)
encontrar_diffs(Lista1, Lista2, Result) :-
	findall(X, (pertence(X, Lista1), not(pertence(X, Lista2))), Result1),
	findall(Y, (pertence(Y, Lista2), not(pertence(Y, Lista1))), Result2),	
	concatenar(Result1, Result2, Result).

%modo(+,?)  	--concatena duas listas
sub([],[]):-!.
sub([Prim|Resto], [Prim|SubConj]) :-
	sub(Resto, SubConj).
sub([_|Resto], SubConj):-
	sub(Resto, SubConj).

%modo(+,?)
ordenar_simple([]):-!.
ordenar_simple(Lista, Result) :- 
	permutar_listas(Lista, Result),
	ordenada(Result), !.
ordenada([]):-!.		    
ordenada([_]).
ordenada([X, Y|Z]) :-
	maior(Y, X),
	ordenada([Y|Z]).
		
%modo(+,-)
bubblesort(Lista, Result) :-
	concatenar(Elem, [Cab, Cau|Cauda], Lista),
	maior(Cab,Cau),
	concatenar(Elem, [Cau, Cab|Cauda], Lista1),
	bubblesort(Lista1, Result), 
	!.			
bubblesort(Lista, Lista).	

%modo(+,-)
insertionsort([], []).
insertionsort([Cab|Cau], Result) :-
	insertionsort(Cau, CauOrd),
	inserir(Cab, CauOrd, Result).

quicksort([], []).
quicksort([X|Cau], Result) :-
	particionar(X, Cau, Menor, Maior),
	quicksort(Menor, MenorOrd),
	quicksort(Maior, MaiorOrd),
	concatenar(MenorOrd, [X|MaiorOrd], Result).
		