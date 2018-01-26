:-include('/Users/rodolfosmac/Documents/Projetos/Prolog/Aula01/src/helpers/hlpListas.pl').

%modo(+Predicado, +NVezes, ?Tempo)
medir_performance(Pred, Tempo) :-
	get_time(T1),
	execute(Pred),
	get_time(T2),
	tempo(T2-T1,T12),
	Tempo is T2 + T1,
	escreva(Pred,T12).

execute(Pred) :- 
	Pred.		
			
tempo(time(Hf, Mf, Sf, Csf) + time(Hi, Mi, Si, Csi), T) :-
	H is (Hf - Hi) * 360000,
	M is (Mf - Mi) * 6000,
	S is (Sf - Si) * 100,
	Cs is Csf - Csi,
	T is H + M + S + Cs.
	
escreva(Pred, Tempo) :-
	nl,
	tab(10), write('Predicado   --> '), write(Pred), nl,
	tab(10), write('Tempo       --> '), write(Tempo), nl,
	nl.
	
	
	
					