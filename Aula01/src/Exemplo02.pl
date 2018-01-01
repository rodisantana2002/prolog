/*
programa que calcula a soma entre os elementos. 
program 
*/

numero(7).
numero(8).
numero(6).
numero(5).
numero(4).
numero(3).
numero(2).
numero(1).

ver_num(Xpar) :-
	numero(N1),
	numero(N2),
	N1 =\= N2, %regra que define que nao deve somar o elemento com ele proprio
	Xpar is (N1*N2),
	write(N1) , write(' .... '),   write(N2), write(' .... '),  write(Xpar),
	nl.
	%fail.

