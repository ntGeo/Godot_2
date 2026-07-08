extends Area2D




func _on_body_entered(body: Node2D) -> void:
		print(enemigo en area)
	
	
func shoot():
	const BALA = preload("res://Scenes/proyectil.tscn")
	$CollisionShape2D/Sprite2D/punto_disparo
