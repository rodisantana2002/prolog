
ligado(a,b,5).
ligado(a,c,10).
ligado(a,g,75).
ligado(c,d,10).
ligado(d,g,15).
ligado(d,e,5).
ligado(g,f,20).
ligado(e,f,5).
ligado(b,f,25).
ligado(b,e,5).
ligado(d,f,25).

min([Elem], Elem).
min([Elem,Y|Cau], Min) :- 
	Elem =< Y, 
	!,
	min([Elem|Cau], Min).
min([_,Y|Cau], Min) :- min([Y|Cau], Min).	

rota(X,Y,Km) :- ligado(X,Y,Km).
rota(X,Y,Km) :- ligado(X,Z,C1),        
	rota(Z,Y,C2),
	Km is C1 + C2.
	
inserir_final([], Y, [Y]).         
inserir_final([I|R], Y, [I|R1]) :- 
    inserir_final(R, Y, R1).  	
	
exibe(Inicio, Termino, Km) :- findall(X, rota(Inicio, Termino, X), Result), min(Result, Km).
