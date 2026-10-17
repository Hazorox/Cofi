extends Control

@onready var pause_layer:CanvasLayer = $pause

func _ready()->void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta:float)->void:
	if Input.is_action_just_pressed("pause"):
		if pause_layer.visible ==true:
			get_tree().paused = false
			pause_layer.visible=false
		else:
			get_tree().paused = true
			pause_layer.visible = true
