(define (problem strips-gripper2)

  (:domain gripper-strips)
  (:objects r
    rooma roomb - room
    ball1 ball2 - ball
    left right - gripper)

  (:init
      (at-robby rooma)
      (free left)
      (free right)
      (at ball1 rooma)
      (at ball2 rooma))

  (:goal (at ball1 roomb))
)
