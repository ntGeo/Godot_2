extends Control


#funcion para contruir la torre
func _on_tower_1_pressed() -> void:
	pass
	#selected_tower_scene = preload("res://Scenes/torre1.tscn")
		
#inicia el juego sin poder ver el menu
func _ready() -> void:
	visible = false
	
#Al presionar tab sacar el menu de contruir
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Tab") and visible == false:
		print('menu')
		visible = true
	
	elif Input.is_action_just_pressed("Tab") and visible == true:
		print('menu')
		visible = false
