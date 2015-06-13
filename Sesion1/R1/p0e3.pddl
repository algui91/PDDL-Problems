(define (problem RDistribuye-1)
(:domain RobotDistribuidor)
(:objects
	r1 - robot
	p1 - paquete
	p2 - paquete
	hab0 - habitacion
	hab1 - habitacion
	hab2 - habitacion
	fl0 - flevel
	fl1 - flevel
	fl2 - flevel
	)
(:init
	(at r1 hab0)
	(at p1 hab0)
	(at p2 hab2)
	(free r1)
	(batterylevel r1 fl2)
	(cambio fl2 fl1)
	(cambio fl1 fl0)
	(cambio fl0 fl2)

	(cambio-fast fl2 fl0)
	(cambio-fast fl0 fl2)

	(conectada hab0 hab1)
	(conectada hab1 hab0)
	(conectada hab2 hab1)
	(conectada hab1 hab2)
)
(:goal (and
	(at r1 hab1)
	(at p2 hab0)
	(at p1 hab2)
	))
)
