(define (problem RDistribuye-1)
(:domain RobotDistribuidor)
(:objects
	r1 r2 - robot
	p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - paquete
	hab0 - habitacion
	hab1 - habitacion
	hab2 - habitacion

	)
(:init
	(at r1 hab0)
	(at r2 hab2)
	(at p1 hab0)
	(at p2 hab0)
	(at p3 hab0)
	(at p4 hab0)
	(at p5 hab0)
	(at p6 hab2)
	(at p7 hab2)
	(at p8 hab2)
	(at p9 hab2)
	(at p10 hab2)
	(free r1)
	(free r2)
	(= (battery-left r1 ) 2)
	(= (battery-left r2 ) 2)
	(conectada hab0 hab1)
	(conectada hab1 hab0)
	(conectada hab2 hab1)
	(conectada hab1 hab2)

)
(:goal (and
	(at p6 hab0)
	(at p7 hab0)
	(at p8 hab0)
	(at p9 hab0)
	(at p10 hab0)
	(at p1 hab2)
	(at p2 hab2)
	(at p3 hab2)
	(at p4 hab2)
	(at p5 hab2)
	(at r1 hab1)
	(at r2 hab1)
	))

)
