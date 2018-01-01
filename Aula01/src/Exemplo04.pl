menu(0).
menu(X) :-
	repeat,
	nl,
	write('DIGITE A OPÇÂO:'),
	read(X),
	X >= 0,
	\+(X >= 3),
	acao(X),
	menu(X).
	
acao(0).
acao(1).
acao(2).
acao(3).