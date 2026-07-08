extends CharacterBody2D

const SPEED = 100

#Referencia a Pathfollow
var path_follow: PathFollow2D = null

func _physics_process(delta):
	if path_follow == null:
		return
		
	path_follow.progress += SPEED * delta
	
	global_position = path_follow.global_position
