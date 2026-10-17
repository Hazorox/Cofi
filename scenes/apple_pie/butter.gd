extends Node2D

var dragging : bool = false
var drag_offset := Vector2.ZERO

func _process(_delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() + drag_offset

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is  InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_offset = global_position - get_global_mouse_position()
			else:
				dragging = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("apple_pie_pot"):
			Globals.butter_in_apple_pot = true
			queue_free()
