/*
*/
:-include('/Users/rodolfosmac/Documents/Projetos/Prolog/Aula01/src/helpers/hlpListas.pl').
:-include('/Users/rodolfosmac/Documents/Projetos/Prolog/Aula01/src/helpers/bdRotas.pl').

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

%modo(+,+,?)
pior_rota(Inicio, Termino, Km) :- 
	findall(X, caminho(Inicio, Termino, X, _), Result), max(Result, Km).

%modo(+,+)	
pesquisar_rotas(Inicio, Termino) :- 
	imprime(['------------------------------------------------------------', 
		 '                Bem Vindo ao Tabajara Maps                  ',
		 '------------------------------------------------------------']),		 
	findall((-Cam-X-'km'), (caminho(Inicio, Termino, X, Cam)), Result), 
	count(Result, NumRotas),
	write('Encontramos ('), write(NumRotas), write(') trajetos para o seu destino.'), nl,
        write('------------------------------------------------------------'), nl,
        write(' Origem.: '), write(Inicio), nl,
        write(' Destino: '), write(Termino), nl,
        write('------------------------------------------------------------'), nl,
	imprime(Result),
	write('------------------------------------------------------------'), nl,			 
	write(' As melhores rotas possuem '), melhor_rota(Inicio, Termino, KmM), write(KmM), write('-km de distância:'), nl,
	write('------------------------------------------------------------'), nl,
	findall(-Z, caminho(Inicio, Termino, KmM, Z), ResultMelhor),
	imprime(ResultMelhor),
	write('------------------------------------------------------------'), nl,			 
	write(' As piores rotas possuem '), pior_rota(Inicio, Termino, KmP), write(KmP), write('-km de distância:'), nl,
	write('------------------------------------------------------------'), nl,
	findall(-P, caminho(Inicio, Termino, KmP, P), ResultPior),
	imprime(ResultPior),
	write('------------------------------------------------------------'),
	!.