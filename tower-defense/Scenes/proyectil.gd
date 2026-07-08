extends Area2D

const VELOCIDAD = 1000
const RANGO = 1200

var distancia_viajada = 0
var direccion = Vector2.RIGHT.rotated(rotation)
var target: Node2D = null

# Funcion del movimiento de la bala
#func _physics_process(delta: float) -> void:
	#position += direccion * VELOCIDAD * delta
	# bullet script


func _physics_process(delta: float) -> void:
	if target and is_instance_valid(target):
		direccion = (target.global_position - global_position).normalized()
		rotation = direccion.angle()
	position += direccion * VELOCIDAD * delta
	
	
	# Desaparece el proyectil a los 1200px
	distancia_viajada += VELOCIDAD * delta
	if distancia_viajada > RANGO:
		queue_free()


# Daño
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()
	queue_free()
	
	
