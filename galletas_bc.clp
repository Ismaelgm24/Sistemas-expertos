(deftemplate indice_cromatico
    0 10
    (
        ; Definición: (1/4, 0.5/6, 0/7)
        (un_poco_crudas (4 1) (6 0.5) (7 0))
        
        ; Definición: (0/3, 1/5, 1/6, 0/8)
        (medio_hechas (3 0) (5 1) (6 1) (8 0))
        
        ; Definición: (0/5, 1/7)
        (doraditas (5 0) (7 1))
    )
)

(deftemplate temperatura
    150 250
    (
        ; Definición: (0/150, 1/160, 1/180, 0/190)
        (baja (150 0) (160 1) (180 1) (190 0))
        
        ; Definición: (0/170, 1/190, 1/210, 0/230)
        (media (170 0) (190 1) (210 1) (230 0))
        
        ; Definición: (0/210, 1/220, 1/240, 0/250)
        (alta (210 0) (220 1) (240 1) (250 0))
    )
)

; Regla A: Si un poco crudas -> temperatura media
(defrule regla_crudas
    (indice_cromatico un_poco_crudas)
=>
    (assert (temperatura media))
)

; Regla B: Si medio hechas -> temperatura alta
(defrule regla_hechas
    (indice_cromatico medio_hechas)
=>
    (assert (temperatura alta))
)

; Regla C: Si doraditas -> temperatura baja
(defrule regla_doraditas
    (indice_cromatico doraditas)
=>
    (assert (temperatura baja))
)