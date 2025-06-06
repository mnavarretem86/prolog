%Hechos.
es_padre(juan,maria).
es_padre(juan,jose).
es_padre(pedro,juan).
es_padre(milton,carol).
es_madre(carol,maria).
es_madre(carol,jose).
es_madre(laura,camila).




%Reglas.
es_abuelo(A,B) :- es_padre(A,C), (es_padre(C,B); es_madre(C,B)).
es_hermano(A,B) :-  A \= B,es_padre(P,A), es_padre(P,B) , es_madre(M,A),es_madre(M,B).

                     son_primos(A, B) :- 
                        A \= B,
                        (
                            (es_padre(P1, A), es_padre(P2, B), es_hermano(P1, P2)); 
                            (es_madre(M1, A), es_madre(M2, B), es_hermano(M1, M2));
                            (es_padre(P1, A), es_madre(M2, B), es_hermano(P1, M2));
                            (es_madre(M1, A), es_padre(P2, B), es_hermano(M1, P2))
                        ).
                    