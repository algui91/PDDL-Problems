(define (domain zeno-travel)

(:requirements
  :typing
  :fluents
  :derived-predicates
  :negative-preconditions
  :universal-preconditions
  :disjuntive-preconditions
  :conditional-effects
  :htn-expansion

  ; Requisitos adicionales para el manejo del tiempo
  :durative-actions
  :metatags
 )

(:types aircraft person city - object)
(:constants slow fast - object)
(:predicates (at ?x - (either person aircraft) ?c - city)
             (in ?p - person ?a - aircraft)
             (different ?x ?y) (igual ?x ?y)
             (hay-fuel ?a ?c1 ?c2)
             )
(:functions (fuel ?a - aircraft)
            (distance ?c1 - city ?c2 - city)
            (slow-speed ?a - aircraft)
            (fast-speed ?a - aircraft)
            (slow-burn ?a - aircraft)
            (fast-burn ?a - aircraft)
            (capacity ?a - aircraft)
            (refuel-rate ?a - aircraft)
            (total-fuel-used)
            (boarding-time)
            (debarking-time)
            (fuel-limit)
            )
;; el consecuente "vacio" se representa como "()" y significa "siempre verdad"
(:derived
  (igual ?x ?x) ())

(:derived
  (different ?x ?y) (not (igual ?x ?y)))



;; este literal derivado se utiliza para deducir, a partir de la información en el estado actual,
;; si hay fuel suficiente para que el avión ?a vuele de la ciudad ?c1 a la ?c2
;; el antecedente de este literal derivado comprueba si el fuel actual de ?a es mayor que 1.
;; En este caso es una forma de describir que no hay restricciones de fuel. Pueden introducirse una
;; restricción más copleja  si en lugar de 1 se representa una expresión más elaborada (esto es objeto de
;; los siguientes ejercicios).
(:derived

  (hay-fuel ?a - aircraft ?c1 - city ?c2 - city)
  (> (fuel ?a) (slow-burn ?a)))

(:task transport-person
   ; El parámetro ?to queda asignado para los tres métodos, si no se cumple en el
   ; case1, en el resto de los cases podemos reutilizarlo, y estará instanciado
   ; al valor que tome aquí.
   :parameters (?p - person ?to - city)

   ;; Si la persona está en la ciudad destino no hace nada
   (:method Case1
      :precondition (at ?p ?to)
      :tasks ()
   )

   ;; Avión y persona en la misma ciudad de origen
   (:method Case2
      ; ?from no se pasaba como parámetro, pero ahora se buscará una instanciación
      ; distinta a ?to
      :precondition (and (at ?p - person ?from - city) (at ?a - aircraft ?from - city))
      :tasks (
         (board ?p ?a ?from)
         (mover-avion ?a ?from ?to)
         (debark ?p ?a ?to ))
   )

   ;; Problema 1
   ;; La persona está en la ciudad de origen, pero el avión está en otra ciudad, distinta
   ;; a ?to y a ?from, la llamamos ?c2
   (:method Case3
      :precondition (
        and
          (at ?p - person ?from - city)
          (at ?a - aircraft ?c2 - city)
      )
      :tasks (
         ;; Mueve el avión de donde está a la ciudad origen de la persona
         (mover-avion ?a ?c2 ?from)
         (board ?p ?a ?from)
         (mover-avion ?a ?from ?to)
         (debark ?p ?a ?to )
      )
   )
;; _________________________________________________________________________________________________________________
)

(:task mover-avion
 :parameters (?a - aircraft ?from - city ?to -city)

 ;; Hay combustible para ir rápido y el fuel gastado no supera el límite
 (:method vuelo-rapido
    :precondition (
       and
       (>= (fuel ?a)
          (*  (distance ?from ?to)
              (fast-burn ?a)))
       (< (+ (total-fuel-used)
          (* (distance ?from ?to) (fast-burn ?a)))
        (fuel-limit))
    )
    :tasks (
       (zoom ?a ?from ?to)
    )
 )
  ;; Igual para el lento
  (:method vuelo-lento
     :precondition (
        and
        (hay-fuel ?a ?from ?to)
        (<  (+ (total-fuel-used)
            (* (distance ?from ?to) (slow-burn ?a)))
          (fuel-limit))
     )
     :tasks (
        (fly ?a ?from ?to)
     )
  )

  (:method fuel-insufuciente-vuelo-rapido
     :precondition (
        and
        (not (hay-fuel ?a ?from ?to))
        (< (+ (+ (total-fuel-used)
                 (* (distance ?from ?to) (fast-burn ?a)) )
              (capacity ?a)) (fuel-limit))
     )
     :tasks (
        (refuel ?a ?from)
        (zoom ?a ?from ?to)
     )
  )

  (:method fuel-suficiente
    :precondition (hay-fuel ?a ?from ?to)
    :tasks (
      (fly ?a ?from ?to)
    )
  )

   ;; Si no hay combustible
  (:method fuel-insufuciente
    ;; No hay combustible para ir de ?from a ?to en el avion ?a
    :precondition ( not (hay-fuel ?a ?from ?to ))
    :tasks (
      (refuel ?a ?from)
      (fly ?a ?from ?to)
    )
  )
)

(:import "Primitivas-Zenotravel.pddl")


)
