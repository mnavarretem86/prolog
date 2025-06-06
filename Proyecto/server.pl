:- set_prolog_flag(encoding, utf8).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_cors)).
:- use_module('conocimiento.pl'). %%Modulo de conocimiento

% Configuración CORS para permitir todas las conexiones
:- set_setting(http:cors, [*]).

% Iniciar servidor en puerto 9090
iniciar_servidor :-
    http_server(http_dispatch, [port(9090)]).

% Registrar handlers
:- http_handler('/diagnostico', manejar_diagnostico, [methods([post, options])]).
:- http_handler('/sintomas', obtener_sintomas, [methods([get])]).

% Diagnóstico basado en síntomas
diagnosticar(Sintomas, Enfermedad, Probabilidad) :-
    findall(
        Puntuacion-Enf,
        (
            enfermedad(Enf, SintomasEnf),
            intersection(Sintomas, SintomasEnf, Coinciden),
            length(Coinciden, C),
            length(SintomasEnf, TotalEnfermedad),
            length(Sintomas, TotalPaciente),
            (   member(fiebre, SintomasEnf) -> Bonus = 0.05 ; Bonus = 0 ),
            Puntuacion is (C/TotalEnfermedad * 0.7) + (C/TotalPaciente * 0.3) + Bonus
        ),
        Resultados
    ),
    (   Resultados = []
    ->  Enfermedad = 'enfermedad_desconocida',
        Probabilidad = 0
    ;   keysort(Resultados, Ordenados),
        reverse(Ordenados, [MejorPuntuacion-Enfermedad|_]),
        Probabilidad is round(MejorPuntuacion * 100)
    ).

% Handler para POST /diagnostico 
manejar_diagnostico(Request) :-
    (   memberchk(method(options), Request)
    ->  cors_enable(Request, [methods([post, options])]),
        format('~n')
    ;   cors_enable(Request, [methods([post])]),
        http_read_json_dict(Request, Dict),
        (   get_dict(sintomas, Dict, SintomasList)
        ->  (   is_list(SintomasList),
                length(SintomasList, L),
                L > 4, L =< 7,
                maplist(atom_string, Sintomas, SintomasList),
                diagnosticar(Sintomas, Diagnostico, Probabilidad),
                obtener_recomendacion(Diagnostico, Recomendacion),
                atom_string(Diagnostico, DiagnosticoStr),
                atom_string(Recomendacion, RecomendacionStr),
                reply_json_dict(_{
                    status: ok,
                    diagnostico: DiagnosticoStr,
                    probabilidad: Probabilidad,
                    recomendacion: RecomendacionStr
                }, [content_type('application/json; charset=UTF-8')])
            ;   reply_json_dict(_{
                    status: error,
                    error: 'Debe proporcionar entre 5 y 7 síntomas'
                }, [status(400), content_type('application/json; charset=UTF-8')])
            )
        ;   reply_json_dict(_{
                status: error,
                error: 'Se requiere el campo "sintomas"'
            }, [status(400), content_type('application/json; charset=UTF-8')])
        )
    ).

% Handler para GET /sintomas
obtener_sintomas(Request) :-
    cors_enable(Request, [methods([get])]),
    setof(Sintoma, Enfermedad^Lista^(enfermedad(Enfermedad, Lista), member(Sintoma, Lista)), SintomasUnicos),
    % Para cada síntoma obtener su categoría (si no hay categoría, poner 'Desconocida')
    findall(_{sintoma: SintStr, categoria: CatStr},
        (
            member(Sint, SintomasUnicos),
            atom_string(Sint, SintStr),
            (   sintoma_categoria(Sint, Cat) -> atom_string(Cat, CatStr)
            ;   CatStr = "Desconocida"
            )
        ),
        SintomasConCategoria),
    reply_json_dict(_{sintomas: SintomasConCategoria}, [content_type('application/json; charset=UTF-8')]).

