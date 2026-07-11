extends Control
var following_tower: Node2D = null  # persists across frames
const  TORRE1 = preload("res://Scenes/torre1.tscn")
#funcion para contruir la torre


#inicia el juego sin poder ver el menu
func _ready() -> void:
	visible = false
	
func _on_tower_1_pressed() -> void:
		spawn_tower(TORRE1)
		print('spawn tower1')

func spawn_tower(tower_scene: PackedScene) -> void:
	if following_tower:
		following_tower.queue_free()  # remove any previous one first

	following_tower = tower_scene.instantiate()
	get_tree().current_scene.add_child(following_tower)

	
#Al presionar tab sacar el menu de contruir
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Tab") and visible == false:
		print('menu')
		visible = true
	
	elif Input.is_action_just_pressed("Tab") and visible == true:
		print('menu')
		visible = false
		
	if following_tower:
		following_tower.global_position = get_global_mouse_position()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if following_tower:
			following_tower = null  # _process stops touching it, so it stays put
