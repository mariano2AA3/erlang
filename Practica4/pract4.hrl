-record(carta,{valor,palo}).

-record(mano,{cartas=[]}).

-record(persona,{nombre,apellidos,dni,edad,calle,ciudad}).

-ifndef(VALORES).
 -define(VALORES,[as,2,3,4,5,6,7,8,9,10,j,q,k]).
-endif.
