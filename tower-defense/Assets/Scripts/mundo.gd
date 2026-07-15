extends Node2D

func _process(delta):
	$HUD/LabelVidas.text = "Vidas: " + str(GameManager.vidas)
	$HUD/LabelMonedas.text = "Monedas: " + str(GameManager.monedas)
