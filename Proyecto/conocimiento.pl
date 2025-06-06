:- module(conocimiento, [enfermedad/2, obtener_recomendacion/2, sintoma_categoria/2]).

% --- Base de conocimiento: enfermedades y síntomas ---

enfermedad(gripe, [fiebre, tos, dolor_cabeza, dolor_muscular, fatiga, escalofrios, congestion_nasal, malestar_general, dolor_garganta]).
enfermedad(resfriado_comun, [congestion_nasal, estornudos, dolor_garganta, tos_leve, malestar_general, ojos_aguados, dolor_cabeza, fatiga]).
enfermedad(covid19, [fiebre, tos, perdida_olfato, perdida_gusto, dificultad_respiratoria, fatiga_extrema, dolor_pecho, diarrea, dolor_cabeza]).
enfermedad(alergia_estacional, [estornudos, picazon_ojos, congestion_nasal, picazon_piel, lagrimeo, ojos_rojos, tos_leve, secrecion_nasal]).
enfermedad(migrana, [dolor_cabeza, nausea, sensibilidad_luz, sensibilidad_sonido, aura_visual, vision_borrosa, fatiga, vomitos]).
enfermedad(gastroenteritis, [nausea, vomitos, diarrea, dolor_abdominal, fiebre_leve, fatiga, perdida_apetito, dolor_cabeza]).
enfermedad(bronquitis, [tos_persistente, flema, dificultad_respiratoria, fatiga, dolor_pecho_leve, sibilancias, tos_nocturna, fiebre_leve]).
enfermedad(neumonia, [fiebre_alta, escalofrios, tos_con_flema, dolor_pecho, dificultad_respiratoria, fatiga_extrema, palidez, sudoracion]).
enfermedad(amigdalitis, [dolor_garganta_intenso, fiebre, dificultad_tragar, inflamacion_ganglios, malestar_general, dolor_cabeza, tos_leve]).
enfermedad(sinusitis, [congestion_nasal, dolor_sinusal, secrecion_espesa, dolor_cabeza, tos_nocturna, fatiga, presion_facial, fiebre_leve]).
enfermedad(conjuntivitis, [ojos_rojos, picazon_ocular, lagrimeo, secrecion_ocular, sensibilidad_luz, hinchazon_parpados, ardor_ocular]).
enfermedad(otitis, [dolor_oido, fiebre, irritabilidad, perdida_audicion, secrecion_oido, mareos, inflamacion_oido]).
enfermedad(artritis, [dolor_articulaciones, rigidez_matutina, inflamacion_articulaciones, fatiga, limitacion_movimiento, dolor_muscular, fiebre_leve]).
enfermedad(anemia, [fatiga, palidez, debilidad, mareos, dificultad_respiratoria, dolor_cabeza, manos_frias, taquicardia]).
enfermedad(depresion, [tristeza_persistente, perdida_interes, cambios_sueno, fatiga, dificultad_concentracion, llanto_injustificado, irritabilidad, perdida_apetito]).
enfermedad(ansiedad, [nerviosismo, preocupacion_excesiva, taquicardia, sudoracion, dificultad_dormir, temblores, dificultad_concentracion, fatiga]).
enfermedad(hipertension, [dolor_cabeza, mareos, vision_borrosa, fatiga, sangrado_nasal, palpitaciones, ansiedad, zumbido_oidos]).
enfermedad(diabetes, [sed_excesiva, hambre_constante, fatiga, vision_borrosa, cicatrizacion_lenta, infecciones_frecuentes, perdida_peso, orina_frecuente]).
enfermedad(asma, [tos_seca, sibilancias, dificultad_respiratoria, opresion_pecho, ansiedad, fatiga, tos_nocturna, palpitaciones]).
enfermedad(apendicitis, [dolor_abdominal_intenso, nausea, vomitos, fiebre, perdida_apetito, estreñimiento, inflamacion_abdomen]).
enfermedad(hepatitis, [fatiga, ictericia, dolor_abdominal, nausea, vomitos, orina_oscura, fiebre_leve]).
enfermedad(mononucleosis, [fiebre, dolor_garganta, inflamacion_ganglios, fatiga_extrema, dolor_cabeza, perdida_apetito, erupcion_cutanea]).
enfermedad(lupus, [fatiga, dolor_articulaciones, erupcion_malar, fiebre_leve, perdida_peso, sensibilidad_solar, dolor_muscular]).
enfermedad(faringitis, [dolor_garganta, fiebre, dolor_cabeza, inflamacion_ganglios, malestar_general, tos_seca]).
enfermedad(herpes_zoster, [erupcion_cutanea, dolor_ardor, fiebre, sensibilidad_piel, fatiga, dolor_cabeza]).
enfermedad(cistitis, [dolor_miccion, urgencia_miccion, orina_turbia, dolor_abdominal, fiebre_leve, malestar_general]).
enfermedad(hipotiroidismo, [fatiga, aumento_peso, piel_seca, depresion, frio_constante, cabello_fino]).
enfermedad(hipertiroidismo, [perdida_peso, palpitaciones, sudoracion_excesiva, nerviosismo, fatiga, diarrea]).
enfermedad(rinitis, [estornudos, congestion_nasal, secrecion_nasal, picazon_ojos, tos_leve, ojos_aguados]).
enfermedad(esclerosis_multiple, [fatiga, vision_borrosa, debilidad_muscular, mareos, dificultad_concentracion, hormigueo_extremidades]).

% --- Recomendaciones por enfermedad ---

obtener_recomendacion(gripe, 'Reposo en cama, hidratacion abundante (2-3 litros/dia), paracetamol 500mg cada 8 horas para fiebre/dolor. Consultar si fiebre persiste mas de 72 horas.').
obtener_recomendacion(resfriado_comun, 'Descanso, antihistaminicos (loratadina 10mg/dia), analgesicos suaves. Gargaras con agua tibia y sal para aliviar garganta. Duracion tipica: 7-10 dias.').
obtener_recomendacion(covid19, 'Aislamiento estricto por 14 dias. Monitorear saturacion de oxigeno (debe ser >92%). Acudir a urgencias si dificultad respiratoria. Prueba PCR recomendada.').
obtener_recomendacion(alergia_estacional, 'Antihistaminicos (cetirizina 10mg/dia), evitar alergenos conocidos. Lavados nasales con solucion salina. Consultar alergologo para inmunoterapia.').
obtener_recomendacion(migrana, 'Reposo en habitacion oscura y silenciosa. Sumatriptan 50mg al inicio del aura. Evitar desencadenantes (chocolate, vino tinto, estres). Hidratacion adecuada.').
obtener_recomendacion(gastroenteritis, 'Dieta blanda (arroz, manzana, pan tostado). Suero oral para hidratacion. Loperamida solo en casos sin fiebre. Consultar si sintomas persisten >48h.').
obtener_recomendacion(bronquitis, 'Expectorantes (acetilcisteina), hidratacion abundante. Evitar tabaco. Puede durar 2-3 semanas. Antibioticos solo si infeccion bacteriana confirmada.').
obtener_recomendacion(neumonia, 'Antibioticos (amoxicilina-clavulanico segun prescripcion). Reposo absoluto. Oxigeno suplementario si saturacion <90%. Hospitalizacion en casos graves.').
obtener_recomendacion(amigdalitis, 'Analgesicos (ibuprofeno 400mg/8h), gargaras con agua salada. Antibioticos solo si test estreptococico positivo. Cirugia en casos recurrentes.').
obtener_recomendacion(sinusitis, 'Descongestionantes nasales (oximetazolina max 3 dias), irrigacion nasal con solucion salina. Antibioticos si sintomas >10 dias o fiebre alta.').
obtener_recomendacion(conjuntivitis, 'Compresas frias, lagrimas artificiales. Antibioticos topicos solo en bacteriana. Evitar lentes de contacto hasta curacion completa (7-10 dias).').
obtener_recomendacion(otitis, 'Analgesicos (paracetamol). Antibioticos (amoxicilina) si <2 anos o sintomas graves. Evitar entrada de agua en oido. Mejora en 48-72h.').
obtener_recomendacion(artritis, 'Antiinflamatorios no esteroideos (naproxeno), fisioterapia. Ejercicio suave regular. Consulta reumatologica para tratamiento modificador de enfermedad.').
obtener_recomendacion(anemia, 'Suplementos de hierro (sulfato ferroso 325mg/dia) con vitamina C para absorcion. Dieta rica en carnes rojas, espinacas. Estudiar causa subyacente.').
obtener_recomendacion(depresion, 'Terapia cognitivo-conductual recomendada. ISRS (sertralina) en casos moderados/graves. Ejercicio regular 30min/dia. Red de apoyo social crucial.').
obtener_recomendacion(ansiedad, 'Tecnicas de relajacion/respiracion. Terapia conductual. Benzodiacepinas solo crisis agudas (lorazepam). Ejercicio aerobico regular reduce sintomas.').
obtener_recomendacion(hipertension, 'Reducir sal (<5g/dia), ejercicio aerobico 150min/semana. Farmacos segun protocolo (enalapril, amlodipino). Monitoreo presion semanal.').
obtener_recomendacion(diabetes, 'Dieta baja en carbohidratos, ejercicio diario. Metformina como primera linea. Monitoreo glucosa capilar. Examen pies diario por neuropatia.').
obtener_recomendacion(asma, 'Broncodilatadores de rescate (salbutamol). Corticoides inhalados preventivos. Evitar desencadenantes (polvo, polen). Plan de accion escrito para crisis.').
obtener_recomendacion(apendicitis, 'URGENCIA QUIRURGICA. No administrar analgesicos hasta diagnostico. NPO (nada por boca). TAC abdominal con contraste para confirmacion.').
obtener_recomendacion(hepatitis, 'Reposo, dieta baja en grasas, evitar alcohol y medicamentos hepatotóxicos. Hidratación abundante. Monitoreo de enzimas hepáticas. Consulta médica si empeoran síntomas.').
obtener_recomendacion(mononucleosis, 'Reposo prolongado, evitar actividades físicas intensas por riesgo de ruptura esplénica. Hidratación. Analgésicos suaves. No se recomiendan antibióticos salvo sobreinfección bacteriana.').
obtener_recomendacion(lupus, 'Seguimiento reumatológico. Corticoides o inmunosupresores según indicación médica. Protección solar diaria. Control de síntomas con AINES o antipalúdicos. Ejercicio suave.').
obtener_recomendacion(faringitis, 'Reposo vocal, gárgaras con agua salada. Analgésicos como ibuprofeno o paracetamol. Antibióticos si origen bacteriano confirmado. Hidratación constante.').
obtener_recomendacion(herpes_zoster, 'Iniciar antivirales (aciclovir) en primeras 72h. Analgésicos para dolor. Compresas frías. Evitar contacto con personas inmunodeprimidas o sin vacuna varicela.').
obtener_recomendacion(cistitis, 'Ingesta abundante de agua. Antibióticos como nitrofurantoína si prescrito. Evitar irritantes urinarios (café, alcohol). Orinar frecuentemente. Consultar si fiebre alta o dolor en espalda.').
obtener_recomendacion(hipotiroidismo, 'Tratamiento con levotiroxina. Monitoreo de TSH cada 6-12 semanas al iniciar. Dieta equilibrada. Evitar alimentos bociógenos crudos en exceso (soya, col).').
obtener_recomendacion(hipertiroidismo, 'Antitiroideos como metimazol. Evitar cafeína. Control cardiaco si taquicardia. Seguimiento con endocrinólogo. Tratamiento definitivo puede incluir yodo radiactivo.').
obtener_recomendacion(rinitis, 'Antihistamínicos (loratadina, cetirizina). Lavados nasales con solución salina. Evitar alérgenos conocidos. Corticoides nasales si síntomas persistentes.').
obtener_recomendacion(esclerosis_multiple, 'Tratamiento con inmunomoduladores (interferones, acetato de glatiramero). Rehabilitación física. Apoyo psicológico. Control de brotes con corticoides. Seguimiento neurológico.').

obtener_recomendacion(enfermedad_desconocida, 'Sintomas atipicos requieren evaluacion medica completa. Pruebas recomendadas: hemograma, PCR, radiografia de torax segun sintomas. Observacion 24-48h.').

% --- Categorías de síntomas ---

sintoma_categoria(fiebre, 'Generales').
sintoma_categoria(fiebre_leve, 'Generales').
sintoma_categoria(fiebre_alta, 'Generales').
sintoma_categoria(tos, 'Respiratorios').
sintoma_categoria(tos_leve, 'Respiratorios').
sintoma_categoria(tos_persistente, 'Respiratorios').
sintoma_categoria(tos_con_flema, 'Respiratorios').
sintoma_categoria(tos_nocturna, 'Respiratorios').
sintoma_categoria(tos_seca, 'Respiratorios').
sintoma_categoria(dolor_cabeza, 'Neurológicos').
sintoma_categoria(dolor_muscular, 'Musculares').
sintoma_categoria(fatiga, 'Generales').
sintoma_categoria(fatiga_extrema, 'Generales').
sintoma_categoria(escalofrios, 'Generales').
sintoma_categoria(congestion_nasal, 'Respiratorios').
sintoma_categoria(estornudos, 'Respiratorios').
sintoma_categoria(dolor_garganta, 'Respiratorios').
sintoma_categoria(dolor_garganta_intenso, 'Respiratorios').
sintoma_categoria(dificultad_tragar, 'Digestivos').
sintoma_categoria(tos_leve, 'Respiratorios').
sintoma_categoria(malestar_general, 'Generales').
sintoma_categoria(perdida_olfato, 'Sensoriales').
sintoma_categoria(perdida_gusto, 'Sensoriales').
sintoma_categoria(dificultad_respiratoria, 'Respiratorios').
sintoma_categoria(picazon_ojos, 'Oculares').
sintoma_categoria(picazon_ocular, 'Oculares').
sintoma_categoria(picazon_piel, 'Dermatológicos').
sintoma_categoria(lagrimeo, 'Oculares').
sintoma_categoria(nausea, 'Digestivos').
sintoma_categoria(vomitos, 'Digestivos').
sintoma_categoria(diarrea, 'Digestivos').
sintoma_categoria(dolor_abdominal, 'Digestivos').
sintoma_categoria(dolor_abdominal_intenso, 'Digestivos').
sintoma_categoria(perdida_apetito, 'Digestivos').
sintoma_categoria(sensibilidad_luz, 'Neurológicos').
sintoma_categoria(sensibilidad_sonido, 'Neurológicos').
sintoma_categoria(aura_visual, 'Neurológicos').
sintoma_categoria(flema, 'Respiratorios').
sintoma_categoria(dolor_pecho, 'Cardíacos').
sintoma_categoria(dolor_pecho_leve, 'Cardíacos').
sintoma_categoria(inflamacion_ganglios, 'Generales').
sintoma_categoria(dolor_sinusal, 'Neurológicos').
sintoma_categoria(secrecion_espesa, 'Respiratorios').
sintoma_categoria(ojos_rojos, 'Oculares').
sintoma_categoria(secrecion_ocular, 'Oculares').
sintoma_categoria(dolor_oido, 'Auditivos').
sintoma_categoria(irritabilidad, 'Psicológicos').
sintoma_categoria(perdida_audicion, 'Auditivos').
sintoma_categoria(secrecion_oido, 'Auditivos').
sintoma_categoria(dolor_articulaciones, 'Musculares').
sintoma_categoria(rigidez_matutina, 'Musculares').
sintoma_categoria(inflamacion_articulaciones, 'Musculares').
sintoma_categoria(limitacion_movimiento, 'Musculares').
sintoma_categoria(palidez, 'Generales').
sintoma_categoria(debilidad, 'Generales').
sintoma_categoria(mareos, 'Neurológicos').
sintoma_categoria(tristeza_persistente, 'Psicológicos').
sintoma_categoria(perdida_interes, 'Psicológicos').
sintoma_categoria(cambios_sueno, 'Psicológicos').
sintoma_categoria(dificultad_concentracion, 'Psicológicos').
sintoma_categoria(nerviosismo, 'Psicológicos').
sintoma_categoria(preocupacion_excesiva, 'Psicológicos').
sintoma_categoria(taquicardia, 'Cardíacos').
sintoma_categoria(sudoracion, 'Generales').
sintoma_categoria(sudoracion_excesiva, 'Generales').
sintoma_categoria(dificultad_dormir, 'Psicológicos').
sintoma_categoria(vision_borrosa, 'Oculares').
sintoma_categoria(sangrado_nasal, 'Respiratorios').
sintoma_categoria(sed_excesiva, 'Endocrinos').
sintoma_categoria(hambre_constante, 'Endocrinos').
sintoma_categoria(cicatrizacion_lenta, 'Endocrinos').
sintoma_categoria(sibilancias, 'Respiratorios').
sintoma_categoria(opresion_pecho, 'Cardíacos').
sintoma_categoria(ansiedad, 'Psicológicos').
sintoma_categoria(erupcion_cutanea, 'Dermatológicos').
sintoma_categoria(erupcion_malar, 'Dermatológicos').
sintoma_categoria(sensibilidad_piel, 'Dermatológicos').
sintoma_categoria(ictericia, 'Digestivos').
sintoma_categoria(orina_oscura, 'Digestivos').
sintoma_categoria(urgencia_miccion, 'Urinarios').
sintoma_categoria(dolor_miccion, 'Urinarios').
sintoma_categoria(orina_turbia, 'Urinarios').
sintoma_categoria(aumento_peso, 'Endocrinos').
sintoma_categoria(frio_constante, 'Endocrinos').
sintoma_categoria(cabello_fino, 'Endocrinos').
sintoma_categoria(palpitaciones, 'Cardíacos').
sintoma_categoria(infecciones_frecuentes, 'Generales').
sintoma_categoria(perdida_peso, 'Generales').
sintoma_categoria(temblores, 'Neurológicos').
sintoma_categoria(hormigueo_extremidades, 'Neurológicos').
sintoma_categoria(debilidad_muscular, 'Musculares').
sintoma_categoria(zumbido_oidos, 'Auditivos').
sintoma_categoria(llanto_injustificado, 'Psicológicos').
sintoma_categoria(presion_facial, 'Neurológicos').
sintoma_categoria(ojos_aguados, 'Oculares').
sintoma_categoria(hinchazon_parpados, 'Oculares').
sintoma_categoria(ardor_ocular, 'Oculares').
sintoma_categoria(inflamacion_oido, 'Auditivos').
sintoma_categoria(secrecion_nasal, 'Respiratorios').
sintoma_categoria(inflamacion_abdomen, 'Digestivos').
sintoma_categoria(nausea, 'Digestivos').