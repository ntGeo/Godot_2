extends Control

func _ready():
	# Conectamos el botón para cargar el mundo
	$Jugar.pressed.connect(_on_jugar)

func _on_jugar():
	get_tree().change_scene_to_file("res://Scenes/mundo.tscn")
