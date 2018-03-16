% predicados para a impressao
% (+)
print1(Var1):- write(Var1).

% (+, +)
print2(Var1, Var2):- write(Var1), write(Var2).

% (+, +, + )
print3(Var1, Var2, Var3):- write(Var1), write(Var2), write(Var3).

% (+, +,+)
print4(Var1, Var2, Var3, Var4):- write(Var1), write(Var2), write(Var3), write(Var4).
