/*
*/
:-include('/Users/rodolfosmac/Documents/Projetos/Prolog/Aula01/src/helpers/hlpListas.pl').
:-include('/Users/rodolfosmac/Documents/Projetos/Prolog/Aula01/src/bd/bdLocalizacao.pl').


%modo(+,+,?,?)
caminho(Ini, Fim, Dist, Cam) :- 
	caminho_aux(Ini, [Fim], 0, Dist, Cam).	
caminho_aux(Cid, [Cid|Cids], Dist, Dist, [Cid|Cids]).
caminho_aux(Ini, [Adj|Cids], Dist, DistF, CamF) :-
	estrada(Intern, Adj, D1),
	not(pertence(Intern, [Adj|Cids])),
	D2 is Dist + D1,
	caminho_aux(Ini, [Intern, Adj|Cids], D2, DistF, CamF).

%modo(+,+,?)
melhor_rota(Inicio, Termino, Km) :- 
	findall(X, caminho(Inicio, Termino, X, _), Result), min(Result, Km).

%modo(+,+)	
exibe(Inicio, Termino) :- 
	findall((X - Cam), caminho(Inicio, Termino, X, Cam), Result), 
	imprime(Result),
	write('melhor rota possui --> '), melhor_rota(Inicio, Termino, Km), write(Km), write('km'), nl,
	findall(Z, caminho(Inicio, Termino, Km, Z), Result1),
	write('rotas disponíveis: '), 
	imprime(Result1).	