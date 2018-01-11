:-include('/Users/rodolfosmac/Documents/Projetos/Prolog/Aula01/src/helpers/hlpListas.pl').
:-include('/Users/rodolfosmac/Documents/Projetos/Prolog/Aula01/src/helpers/bdRotas.pl').

%modo(+,+,-)
num_combinacoes(_, 0, 1) :-!.
num_combinacoes(N, N, 1) :-!.
num_combinacoes(N, R, Num) :-
	N > R,
	N1 is N - 1,
	R1 is R - 1,
	num_combinacoes(N1, R1, Parcela1),
	num_combinacoes(N1, R, Parcela2),
	Num is Parcela1 + Parcela2.
	
%modo(+,+)
combinar_elementos(Lista, Range):-	
	findall(X, combinacoes(Range, Lista, X), Result1),
	remover_duplicados(Result1,Result2),
	count(Result2, NumComb),
	imprime(['------------------------------------------------------------------------', 
		 '                      Bem Vindo ao Simulador Tabajara                   ',
		 '------------------------------------------------------------------------']),		 
	write('Serão geradas ('), write(NumComb), write(') combinações para os parametros informados.'), nl,
        write('------------------------------------------------------------------------'), nl,	
	imprime(Result2),
        write('------------------------------------------------------------------------'), nl.

%modo(+,+,?)	
combinacoes(0, [], []).
combinacoes(R, Conjunto,[Elem|T]):-
	R1 is R - 1,
	sub(Conjunto, [Elem|Resto]),
	combinacoes(R1, Resto, T).