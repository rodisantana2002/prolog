% base de regras e predicados
% importa base de conhecimento
:-include('/Users/rodolfosmac/Documents/Projetos/Prolog/Aula01/src/helpers/bdArvoreGenealogica.pl').
:-include('/Users/rodolfosmac/Documents/Projetos/Prolog/Aula01/src/helpers/hlpPrint.pl').

% (-, +)
ancestral(X,Y) :- pais(X,Y).
ancestral(X,Y) :- pais(X,Z),
			      ancestral(Z,Y).

% (+ , -)
avos(Y, X):-
	findall(X, (pais(X,Z), pais(Z, Y)), Result),
	print4("Os avós de ", Y, " são: ", Result).

% (+, -)
irmao(X, Y):- pais(Z,X), !, pais(Z,Y), X\=Y.

irmaos(X,Y):-
	findall(Y, irmao(X,Y), Result),
	print4("Os irmãos de ", X, " são: ", Result).

% (+, -)
tios(X, Y):-
	findall(Y, (pais(Z, X), irmao(Z, Y)), Result),
	print4("Os tios de ", X, " são: ", Result).

%(+, -)
primos(X, Y):-
	findall(Y, (pais(Z, X), irmao(Z, M), pais(M,Y)), Result),
	print4("Os primos de ", X, " são:", Result).
