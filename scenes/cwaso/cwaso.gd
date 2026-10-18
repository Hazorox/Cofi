extends Node2D

@onready var dough: AnimatedSprite2D = $dough
@onready var cwaso_cut_mini_game = get_parent().get_node("CwasoCut")

var holding = false
var folds = 0

func _ready() -> void:
	Input.set_custom_mouse_cursor(preload("res://assets/icons/icons/icon2.png"), Input.CURSOR_ARROW, Vector2(8,8))
	dough.stop()

func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		holding = true
		dough.play("folding")
	elif holding and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		holding = false
		dough.pause()
	

func _on_dough_animation_looped() -> void:
	folds += 1
	print(folds)
	if folds == 3:
		switch_to(cwaso_cut_mini_game)

func _exit_tree() -> void:
	Input.set_custom_mouse_cursor(null, Input.CURSOR_ARROW, Vector2(0,0))

func switch_to(target_scene: Node) -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	visible = false
	target_scene.process_mode = Node.PROCESS_MODE_INHERIT
	target_scene.visible = true
