extends CharacterBody2D

const SPEED = 80

#Referencia a Pathfollow
var path_follow: PathFollow2D = null

func _physics_process(delta):
	if path_follow == null:
		return
		
	path_follow.progress += SPEED * delta
	global_position = path_follow.global_position
	
	# Si llegó al final del camino → Game Over
	if path_follow.progress_ratio >= 1.0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
