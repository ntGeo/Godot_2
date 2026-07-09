extends Area2D

func _ready():
	# Detectamos cuando algo entra al área final
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Si es un enemigo, activamos Game Over
	print("Algo entró: ", body.name)
	if body.name == "Enemigo":
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
