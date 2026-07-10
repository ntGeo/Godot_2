extends Area2D

func _ready():
	print("FinCamino listo")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	print("Entró: ", body.name)
	if body is CharacterBody2D:
		body.queue_free()
		GameManager.perder_vida()
