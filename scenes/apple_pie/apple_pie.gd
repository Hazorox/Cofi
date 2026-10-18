extends Node2D
signal finished

@onready var idk = get_parent().get_parent().get_parent()

func _ready() -> void:
	global_position = Vector2(130, 50)

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Globals.player_has_apple_pie = true
		Globals.profit += 20
		get_tree().reload_current_scene()
		
