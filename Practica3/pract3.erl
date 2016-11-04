-module(pract3).
-include_lib("eunit/include/eunit.hrl").
-export([different/3, differentBis/3, equal/3, morosos/1, triangulo/1, maxLists/2]).



% Ejer 1
different(F,G,L) -> lists:filter(fun(X) -> F(X)/=G(X) end, L).



% Ejer 2

abs(X) ->
if 
	X > 0 -> X;
	true -> X*(-1)
end.


id(X) -> X.


different_test() -> ?assertEqual(different(fun abs/1,fun id/1,lists:seq(-3,10)), [-3,-2,-1]).



% Ejer 3

differentBis(F,G,L) -> [X || X <- L, F(X) /= G(X)].



% Ejer 4

differentBis_test() -> ?assertEqual(differentBis(fun abs/1,fun id/1,lists:seq(-3,10)), [-3,-2,-1]).



% Ejer 5

equal(F,G,L) -> length(different(F,G,L)) =:= 0.



% Ejer 6

equal_test() -> ?assertEqual(equal(fun abs/1, fun abs/1, lists:seq(-10,10)),true).



% Ejer 7

morosos(L) -> [element(1,X) || X <-L , element(2,X) < 0].



% Ejer 8

morosos_test() -> ?assertEqual(morosos([ {bertoldo, 500}, {herminia,cancelada}, {aniceto,-2000} ]),[aniceto]).



% Ejer 9

triangulo(N) -> [ [ [X || X <- lists:seq(1, Y) ] || Y <- lists:seq(1, N)] ] .



% Ejer 10

aplicarFunciones([],X) -> [];
aplicarFunciones([L|Ln], X) -> lists:append([L(X)], aplicarFunciones(Ln,X)).

maxLists(LF,LV) -> [ lists:foldl(fun erlang:max/2,-1,aplicarFunciones(LF,X)) || X <- LV].


