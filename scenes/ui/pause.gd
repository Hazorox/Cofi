extends CanvasLayer


@onready var buttons:Array[Button] = [$continue,$fullscreen,$exit]
var focused = null
var fullscreen := false

func _ready():
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("down"):
		match focused:
			null:
				focused=0
			0:
				focused=1
			1:
				focused=2
			2:
				focused=0
		buttons[focused].grab_focus()
	elif Input.is_action_just_pressed("up"):
		match focused:
			null:
				focused=0
			0:
				focused = 2
			1:
				focused = 0
			2:
				focused=1
		buttons[focused].grab_focus()
	
func _on_continue_pressed() -> void:
	# Hide and unpause on continue
	visible = false
	get_tree().paused = false

func _on_fullscreen_pressed() -> void:
	# Toggle fullscreen
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_exit_pressed() -> void:
	# Go back to main menu
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu/MainMenu.tscn")
