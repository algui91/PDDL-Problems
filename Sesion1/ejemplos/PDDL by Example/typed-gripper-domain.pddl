(define (domain typed-gripper)

  (:requirements :typing :action-costs)
  (:types room ball gripper)
  (:constants left right - gripper)

  (:predicates
    (at-robby ?r - room)  ;; True iff x is a room and the robot is in it
    (at ?b - ball ?r - room)  ;; True if x is a ball, r a room and x i in r
    (free ?g - gripper) ;; True if g is a gripper and does not hold a ball
    (carry ?o - ball ?g - gripper) ;; true if o is a ball, g a gripper and g holds o
  )

  (:functions
    (total-cost)
  )

  ;; The robot can move from ?from to ?to
  (:action move
    :parameters (?from ?to - room)
    :precondition (at-robby ?from)
    :effect (and (at-robby ?to)
                 (not (at-robby ?from))
                 (increase (total-cost) 10))
  )

  ;; The robot can pick up ?obj in ?room with ?gripper
  (:action pick
    :parameters (?obj - ball ?room - room ?gripper - gripper)
    :precondition (and (at ?obj ?room) (at-robby ?room) (free ?gripper))
    :effect (and (carry ?obj ?gripper ) (not (at ?obj ?room))
            (not (free ?gripper))
            (increase (total-cost) 1))
  )

  ;; The robot can drop ?obj in ?room from ?gripper
  (:action drop
    :parameters (?obj - ball ?room - room ?gripper - gripper)
    :precondition (and (carry ?obj ?gripper) (at-robby ?room))
    :effect (and (at ?obj ?room) (free ?gripper)
    (not (carry ?obj ?gripper))
    (increase (total-cost) 1))
  )
)
