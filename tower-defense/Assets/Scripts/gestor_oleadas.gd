extends Node

# Escena del enemigo
var enemigo_scene = preload("res://Scenes/enemigo.tscn")

# Configuración
var oleada_actual = 0
var enemigos_por_oleada = 5
var tiempo_entre_enemigos = 1
var tiempo_entre_oleadas = 5.0

func _ready():
	iniciar_oleada()

func iniciar_oleada():
	oleada_actual += 1
	# Cada oleada tiene más enemigos
	enemigos_por_oleada = 3 + (oleada_actual - 1) * 2
	print("Oleada ", oleada_actual, " — ", enemigos_por_oleada, " enemigos")
	await get_tree().create_timer(1.0).timeout
	spawnear_enemigos(enemigos_por_oleada)

func spawnear_enemigos(cantidad):
	for i in range(cantidad):
		spawnear_enemigo()
		await get_tree().create_timer(tiempo_entre_enemigos).timeout
	
	# Esperamos antes de la siguiente oleada
	await get_tree().create_timer(tiempo_entre_oleadas).timeout
	iniciar_oleada()

func spawnear_enemigo():
	var path_follow = PathFollow2D.new()
	get_node("/root/mundo/Camino").add_child(path_follow)
	print("PathFollow creado: ", path_follow.get_instance_id())
	
	var enemigo = enemigo_scene.instantiate()
	enemigo.path_follow = path_follow
	get_parent().add_child(enemigo)
