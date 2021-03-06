(define (problem RDistribuye-1)
(:domain RobotDistribuidor)
(:objects
	r1 r2 - robot
	p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - paquete
	hab0 hab1 hab2 hab3 hab4 - habitacion
	fl0 - flevel
	fl1 - flevel
	fl2 - flevel
	)
(:init
	(at r1 hab0)
	(at r2 hab0)
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
	(batterylevel r1 fl2)
	(batterylevel r2 fl2)
	(cambio fl2 fl1)
	(cambio fl1 fl0)
	(cambio fl0 fl2)
	(conectada hab0 hab1)
	(conectada hab1 hab0)
	(conectada hab2 hab1)
	(conectada hab1 hab2)
	(conectada hab1 hab3)
	(conectada hab3 hab1)
	(conectada hab3 hab4)
	(conectada hab4 hab3)
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
	(at r1 hab2)
	(at r2 hab2)
	))

)
