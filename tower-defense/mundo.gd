extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var enemigo_scene = preload("res://enemigo.tscn")
	var enemigo = enemigo_scene.instantiate()

	enemigo.path_follow = $Camino/Recorrido
	add_child(enemigo)
	
