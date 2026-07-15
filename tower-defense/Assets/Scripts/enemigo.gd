extends CharacterBody2D

# Vida del enemigo
var vida = 5

# Velocidad de movimiento
const SPEED = 80

# Referencia al PathFollow2D que seguirá
var path_follow: PathFollow2D = null

func _physics_process(delta):
	if path_follow == null:
		return
	
	# Avanzamos por el camino
	path_follow.progress += SPEED * delta
	global_position = path_follow.global_position
	
	# Si llegó al final del camino → Game Over
	if path_follow.progress_ratio >= 1.0:
		if path_follow != null:
			path_follow.queue_free()
		GameManager.perder_vida()
		queue_free()

func take_damage():
	# Restamos vida al recibir daño
	vida -= 1
	if vida <= 0:
		morir()

func morir():
	# Da monedas al jugador cuando es eliminado por una torre
	GameManager.ganar_monedas()
	if path_follow != null:
		path_follow.queue_free()
	queue_free()
