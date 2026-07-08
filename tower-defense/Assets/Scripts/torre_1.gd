extends Area2D

const BALA = preload("res://Scenes/proyectil.tscn") 
var tiempo_disparo = 0.1
var tiempo_trascurrido = 0.1
var objetivo = null
var nueva_bala = BALA.instantiate()

func _physics_process(delta: float) -> void:
	var  enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()


#func _on_body_entered(body: Node2D) -> void:
	#pass

func _on_body_entered(body: Node2D) -> void:
		print("enemigo en area")
	
	

func shoot():
	var bala = BALA.instantiate() as Area2D
	bala.global_position = %punto_disparo.global_position
	bala.global_rotation = %punto_disparo.global_rotation
	get_tree().current_scene.add_child(bala)


func _on_timer_timeout() -> void:
	shoot()
