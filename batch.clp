; ==========================================
; Script de Ejecución Automática (Batch)
; Ejercicio: Galletas de la Abuela María
; ==========================================

; 1. Cargar la Base de Conocimientos y la Base de Hechos
(load "galletas_bc.clp")
(load "galletas_bh.clp")

; 2. Definir una regla temporal para capturar y mostrar el resultado
;    Esto busca el hecho 'temperatura' automáticamente y calcula su valor nítido.
(defrule imprimir-resultado
    (declare (salience -10)) ; Se asegura de ejecutarse al final de todas las reglas
    ?f <- (temperatura ?)    ; Captura la dirección del hecho difuso de temperatura
    =>
    (printout t " " crlf)
    (printout t "=======================================" crlf)
    (printout t " RESULTADOS DEL CONTROL DEL HORNO" crlf)
    (printout t "=======================================" crlf)
    (printout t "Temperatura calculada (Centro de Masas): " (moment-defuzzify ?f) " C" crlf)
    (printout t "Temperatura calculada (Maximo):          " (maximum-defuzzify ?f) " C" crlf)
    (printout t "=======================================" crlf)
    (printout t " " crlf)
)

; 3. Inicializar los hechos (reset)
(reset)

; 4. Ejecutar el motor de inferencia
(run)