extends Area2D

var distancia_viajada = 0

func _physics_process(delta):
	const VELOCIDAD = 1000
	const RANGO = 1200
	
	var direccion = Vector2.RIGHT.rotated(rotation)
	position += direccion * VELOCIDAD * delta
	
	distancia_viajada += VELOCIDAD * delta
	if distancia_viajada > RANGO:
		queue_free()
