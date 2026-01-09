; ==========================================
; Script de Ejecución Automática (Batch)
; Ejercicio: Galletas de la Abuela María
; ==========================================

; 1. Cargar la Base de Conocimientos y la Base de Hechos
; (Asegúrate de que los nombres coinciden con tus archivos)
(load "galletas_bc.clp")
(load "galletas_bh.clp")

; 2. Regla para mostrar resultados numéricos Y la gráfica
(defrule imprimir-resultado
    (declare (salience -10)) ; Se ejecuta al final
    ?f <- (temperatura ?)    ; Capturamos el hecho en la variable ?f
    =>
    (printout t " " crlf)
    (printout t "=======================================" crlf)
    (printout t " RESULTADOS DEL CONTROL DEL HORNO" crlf)
    (printout t "=======================================" crlf)
    
    ; Cálculos numéricos
    (printout t "Centro de Masas: " (moment-defuzzify ?f) " C" crlf)
    (printout t "Maximo:          " (maximum-defuzzify ?f) " C" crlf)
    
    (printout t "---------------------------------------" crlf)
    (printout t " GRAFICA DEL CONJUNTO DIFUSO RESULTANTE" crlf)
    (printout t "---------------------------------------" crlf)

    ; COMANDO DE GRAFICADO
    ; t = terminal, * = carácter de dibujo, 150 250 = rango, ?f = variable capturada
    (plot-fuzzy-value t * 0 250 ?f)

    (printout t "=======================================" crlf)
    (printout t " " crlf)
)

; 3. Inicializar y Ejecutar
(reset)
(run)