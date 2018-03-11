% trona o programa dinamico
:-dynamic(nElem/1).
:-dynamic(estado/3).
nElem(0).
estado([],[],[]).

mkEstado(E,C,D):- estado(X,Y,Z),
                  retract(estado(X,Y,Z)),
                  assert(estado(E,C,D)).
mknElem(N):- nElem(E),
             retract(nElem(E)),
             assert(nElem(N)).

hanoi(N):- fazLista(N,L),
	    kEstado(L,[],[]),
	    mknElem(N),
        write("---------------------------------------"),
		nl,
        estado(Xs,Ys,Zs),
        write(" Estado Inicial"),
		nl,
        wrtHastes(Xs,Ys,Zs,N+2),
        moveXY(N,a,b,c).

moveXY(0,_,_,_):- !.
moveXY(N,A,B,C):- !,
            	M is N-1,
                moveXY(M,A,C,B),
            	novoXYEst(A,B),
            	get0(_),
            	exibeMovXY(A,B),
            	moveXY(M,C,B,A).

exibeMovXY(X,Y):- !,
                nl,
    			write("---------------------------------------"),
    			nl,
    			write(" Move um disco da torre "),
                write(X),
    			write(" para torre "),
    			write(Y),
    			nl,
                estado(Xs,Ys,Zs),
    			nElem(T),
    			wrtHastes(Xs,Ys,Zs,T+2).

novoXYEst(a,b):- estado([X|Xs],Ys,Zs), mkEstado(Xs,[X|Ys],Zs).
novoXYEst(a,c):- estado([X|Xs],Ys,Zs), mkEstado(Xs,Ys,[X|Zs]).
novoXYEst(c,a):- estado(Xs,Ys,[Z|Zs]), mkEstado([Z|Xs],Ys,Zs).
novoXYEst(c,b):- estado(Xs,Ys,[Z|Zs]), mkEstado(Xs,[Z|Ys],Zs).
novoXYEst(b,c):- estado(Xs,[Y|Ys],Zs), mkEstado(Xs,Ys,[Y|Zs]).
novoXYEst(b,a):- estado(Xs,[Y|Ys],Zs), mkEstado([Y|Xs],Ys,Zs).

% anima a transição dos discos
writeN(N,_):- N<1,!.
writeN(N,C):- write(C),
            N1 is N-1,
            writeN(N1,C).

wrtDisco([0|Ds],N,Ds):- T is (N*2+1) // 2 ,
                        tab(T),
                        write("|"),
                        tab(T).
wrtDisco([D|Ds],N,Ds):- T is (((N*2+1) - (D*2-1)) // 2),
                        tab(T),
                        writeN(D*2-1,"="),
                        tab(T).

wrtDiscoECD(_,_,_,0,_):- !.
wrtDiscoECD(E,C,D,N,M):- wrtDisco(E,M,E2), tab(1),
                         wrtDisco(C,M,C2), tab(1),
                         wrtDisco(D,M,D2), nl,
                         N1 is N-1, wrtDiscoECD(E2,C2,D2,N1,M).

wrtHastes(E,C,D,T):- nl,
                    ajustaN(E,T,E2),
                    ajustaN(C,T,C2),
                    ajustaN(D,T,D2),
                    wrtDiscoECD(E2,C2,D2,T,T), Z is T*2+1,
                    writeN(Z,"-"),
                    tab(1),
                    writeN(Z,"-"),
                    tab(1),
                    writeN(Z,"-"),
                    nl.

ajustaN(L,N,R):- length(L,Tam),
                fazLista2(N-Tam,0,L/R).

fazLista2(N,_,Li/Li):- N=<0, !.
fazLista2(N,V,Li/Lo):- N1 is N-1,
                       fazLista2(N1,V,[V|Li]/Lo).

fazLista(M,L):-!, fazLista(M,1,L).
fazLista(M,N,[]):- N>M,!.
fazLista(M,N,[N|R]):- N1 is N+1,
                      fazLista(M,N1,R).
