-module(pract2).
-export([impares/1, ack/2, mismoConjunto/2, normal/1, interseccion/2, esta/2,nNodos/1, mapTree/2, sonMultiplos/2, h/1]). % /1 indica aridad 1

impares([]) -> [];
impares(L) -> imparesAux(L, 1).

imparesAux([], N) -> [];
imparesAux([X|Xs], N) ->
 if N rem 2 == 1 -> [X|imparesAux(Xs, N+1)];
 	true         -> imparesAux(Xs, N+1)
 end.



ack(M,N) when M==0 -> N+1;
ack(M,N) when M>0, N==0 -> ack(M-1,1);
ack(M,N) when M>0, N>0  -> ack(M-1, ack(M,N-1)).



mismoConjunto(X,[]) -> true;
mismoConjunto([],Y) -> true;
mismoConjunto([X|Xs],Y) -> 
 case contenido(X,Y) of
 true -> mismoConjunto(Xs,Y);
 false -> false
end.


contenido(X,[]) -> false;
contenido(X,Y) -> lists:member(X,Y). 



normal([]) -> [];
normal([X|Xs]) ->
 case contenido(X,Xs) of
 true  -> normal(Xs);
 false -> [X|normal(Xs)]
end .


interseccion([],_) -> [];
interseccion([X|Xs],Y) ->
 case contenido(X,Y) of
 	true -> [X|interseccion(Xs,Y)];
 	false -> interseccion(Xs,Y)
end.
 

esta(E,{}) -> false;
esta(E,{Elem, A1, A2}) ->
 case E==Elem of
 	true -> true;
 	false -> esta(E, A1) orelse esta(E,A2)
 end.


 nNodos({}) -> 0;
 nNodos({Elem,A1,A2}) -> 1+nNodos(A1)+nNodos(A2).

 
 mapTree(F, {}) -> {};
 mapTree(F,{Elem,A1,A2}) -> {F(Elem), mapTree(F,A1), mapTree(F,A2)}.


 sonMultiplos(X,Y) ->
 if 
 	X==0 -> true;
 	Y==0 -> true;
 	X > Y, X rem Y == 0 -> true;
 	X < Y, Y rem X == 0 -> true;
 	true -> false
 end.


h(X) ->
 F = fun
 	(N) when X==0 -> true;
 	(N) when N==0 -> true;
 	(N) when X > N, X rem N == 0 -> true;
 	(N) when X < N, N rem X == 0 -> true
 end.