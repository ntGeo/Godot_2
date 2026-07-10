extends Control

func _ready():
	$BtnReintentar.pressed.connect(_on_reintentar)

func _on_reintentar():
	GameManager.reiniciar()
	get_tree().change_scene_to_file("res://Scenes/mundo.tscn")
