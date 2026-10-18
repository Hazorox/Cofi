extends Node2D

func _ready() -> void:
	global_position = Vector2(randi_range(20, 620), randi_range(20, 340))

func _on_disappearing_timer_timeout() -> void:
	queue_free()

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is  InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				queue_free()
				Globals.blending_progress += 20
