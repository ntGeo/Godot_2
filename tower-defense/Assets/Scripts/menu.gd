extends Control

var following_tower: Node2D = null
const TORRE1 = preload("res://Scenes/torre1.tscn")

func _ready() -> void:
	visible = true
	size = Vector2(160, 648)
	position = Vector2(0, 0)
	print("Menu listo, visible: ", visible, " size: ", size, " pos: ", position)

func _on_tower_1_pressed() -> void:
	spawn_tower(TORRE1)

func spawn_tower(tower_scene: PackedScene) -> void:
	if following_tower:
		following_tower.queue_free()
	following_tower = tower_scene.instantiate()
	get_tree().current_scene.add_child(following_tower)
	following_tower.process_mode = Node.PROCESS_MODE_DISABLED
	following_tower.modulate.a = 0.5

func _process(_delta: float) -> void:
	$Contenido/LabelVidas.text = "Vidas: " + str(GameManager.vidas)
	$Contenido/LabelMonedas.text = "Monedas: " + str(GameManager.monedas)
	
	if following_tower:
		var mouse_pos = get_tree().current_scene.get_canvas_transform().affine_inverse() * get_viewport().get_mouse_position()
		following_tower.global_position = mouse_pos
		#print("Torre siguiendo mouse: ", mouse_pos)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if following_tower:
			if GameManager.puede_construir():
				GameManager.construir_torre()
				following_tower.process_mode = Node.PROCESS_MODE_INHERIT
				following_tower.modulate.a = 1.0
				following_tower = null
			else:
				following_tower.queue_free()
				following_tower = null
				mostrar_aviso()

func mostrar_aviso():
	$Contenido/LabelAviso.visible = true
	# Ocultamos el aviso después de 2 segundos
	await get_tree().create_timer(2.0).timeout
	$Contenido/LabelAviso.visible = false


func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		spawn_tower(TORRE1)
