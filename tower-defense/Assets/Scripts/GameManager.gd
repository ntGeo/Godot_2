extends Node

# Vidas
var vidas = 3
var vidas_maximas = 3
var game_over = false

# Economía
var monedas = 100
var costo_torre = 80
var recompensa_enemigo = 5

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
	monedas = 100

func puede_construir():
	return monedas >= costo_torre

func construir_torre():
	if puede_construir():
		monedas -= costo_torre
		return true
	return false

func ganar_monedas():
	monedas += recompensa_enemigo
