(define (problem strips-gripper2)

  (:domain gripper-strips)
  (:objects r
    rooma roomb - room
    ball1 ball2 ball3 ball4 - ball
    left right - gripper)

  (:init
      (at-robby rooma)
      (free left)
      (free right)
      (at ball1 rooma)
      (at ball2 rooma)
      (at ball3 rooma)
      (at ball4 roomb))

  (:goal (and (at ball1 roomb)
              (at ball2 roomb)
              (at ball3 roomb)
              (at ball4 roomb)))
)
