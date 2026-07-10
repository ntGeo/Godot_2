extends Node

var vidas = 3
var vidas_maximas = 3
var game_over = false

func perder_vida():
	if game_over:
		return
	vidas -= 1
	print("Vidas restantes: ", vidas)
	if vidas <= 0:
		game_over = true
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func reiniciar():
	vidas = vidas_maximas
	game_over = false
