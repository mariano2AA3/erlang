-module(pract4).
-include_lib("eunit/include/eunit.hrl").
-include("pract4.hrl").

-export([poker/1, edad/1, vecinos/2, habitantes/2, incluye/2, mapSafe/2]).



% Ejercicio 2

contar(X, Y) -> contar(X, Y, 0).

contar(_, [], Acc) -> Acc;
contar(#carta{valor=V}=C, [#carta{valor=V}|Xn], Acc) -> contar(C, Xn, Acc+1);
contar(X, [_|Xn], Acc) -> contar(X, Xn, Acc).


poker(#mano{cartas=[]}) -> false;
poker(#mano{cartas=[C|Cn]}) -> 
 case contar(C, Cn) of
 	3 -> true;
 	_ -> poker(#mano{cartas=Cn})

 end.

 

% Ejercicio 3

edad(#persona{edad=E}) -> E.



% Ejercicio 4

vecinos( #persona{calle=C1, ciudad=P1}, #persona{calle=C2,ciudad=P2} ) -> C1=:=C2 andalso P1=:=P2 .



% Ejercicio 5

vive(#persona{ciudad=C},Ciudad) -> C =:= Ciudad.

habitantes(Ps, C) -> [X || X <-Ps, fun vive/2(X,C)].



% Ejercicio 6

mismaPersona(D1, #persona{dni=D2}) -> D1 =:=D2.

incluye(Per, Ps) ->
 case lists:member(Per,Ps) of
 	true -> Ps;
 	false -> lists:append([Per],Ps)

 end.



% Ejercicio 7
 
mapSafe(F,[]) -> [];
mapSafe(F,[X|Xn]) ->
try F(X) of
	N -> [N | mapSafe(F,Xn)]
catch
	error:E -> [error | mapSafe(F,Xn)]
end.




