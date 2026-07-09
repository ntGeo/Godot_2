extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var enemigo_scene = preload("res://Scenes/enemigo.tscn")
	var enemigo = enemigo_scene.instantiate()

	enemigo.path_follow = $Camino/Recorrido
	add_child(enemigo)
	
	

#funcion que gatillaba texto al momento en que enemigo llega a final de camino
#func _on_area_2d_body_entered(body: Node2D) -> void:
	#show_lose_screen()
#
#func show_lose_screen() -> void:
	#%Label.visible = true
	#%Label.text = "You Lose"
	#get_tree().paused = true  # freezes the whole game
