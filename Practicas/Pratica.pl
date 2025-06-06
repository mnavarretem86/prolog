%ECHOOS%
gato(tom).
gato(michi).
perro(firulais).
perro(boby).
ave(piolin).
padre(juan , maria).
edad(mary, 17).
ciudad(john , londres).

%%MIS REGLAS
animal(Nombre_Gato) :- gato(Nombre_Gato).
animal(Nombre_Perro) :- perro(Nombre_Perro).
animal(Nombre_Ave) :- ave(Nombre_Ave).
mayor(X,Y) :- padre(X,Y).
diferente(X, Y) :- (gato(X), perro(Y)) ; (perro(X), gato(Y)).

es_animal(X) :- (gato(X)) ; (perro(X)) ; (ave(X)).


seres_diferentes(X, Y) :- 
                         (gato(X), perro(Y));
                         (perro(X), gato(Y));
                         (gato(X), ave(Y));
                         (ave(X), gato(Y));
                         (perro(X), ave(Y));
                         (ave(X), perro(Y)).

es_hijo(Y,X) :- padre(X,Y).
vive_en(X,Y) :- ciudad(X,Y).
es_mayor_edad(X) :- edad(X,Y) , Y>=18.


padre(juan,maria).
padre(juan,pedro).
madre(ana,pedro).
madre(ana,maria).

%estas son mis reglas%
padres(X,Y) :- padre(X,Y).
padres(X,Y) :- madre(X,Y).

hermano(X,Y) :- 
                padre(P,X), 
                padre(P,Y),
                madre(M,X),
                madre(M,Y), 
                 X\=Y.

%Hermanos parciales%
padre(juan, maria).
padre(juan, pedro).
padre(carlos, sofia).

madre(ana, maria).
madre(luisa, pedro).
madre(luisa, sofia).


hermanos_parciales(X, Y) :-
    padre(P, X), padre(P, Y),
    madre(M1, X), madre(M2, Y),
    M1 \= M2,
    X \= Y.

hermanos_parciales(X, Y) :-
    madre(M, X), madre(M, Y),
    padre(P1, X), padre(P2, Y),
    P1 \= P2,
    X \= Y.







son_hermanos_parciales(X,Y) :- padre(P,X), madre(M,X)