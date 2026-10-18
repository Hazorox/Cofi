extends Node2D

@onready var donut: AnimatedSprite2D = $donut
@onready var fry: Button = $fry
@onready var glaze: Button = $glaze
@onready var cut: Area2D = $Area2D
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var game_scene = get_parent().get_parent()
@onready var cofi_scene = game_scene.get_node("Cofi")

func _ready() -> void:
	Input.set_custom_mouse_cursor(preload("res://assets/icons/icons/icon2.png"), Input.CURSOR_ARROW, Vector2(8,8))
	donut.stop()
	donut.show()
	donut.frame = 0
	cut.show()
	fry.hide()
	glaze.hide()
	cut.input_event.connect(cutted)
	fry.pressed.connect(fried)
	glaze.pressed.connect(glazen)
	
func cutted(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut.hide()
			audio.stream = load("res://assets/SFX/slice.wav")
			audio.play()
			await audio.finished
			donut.frame = 1
			fry.show()
			
func fried():
	donut.hide()
	fry.hide()
	audio.stream = load("res://assets/SFX/sizzling.wav")
	audio.play()
	await audio.finished
	donut.show()
	donut.frame = 2
	glaze.show()
	
func glazen():
	glaze.hide()
	audio.stream = load("res://assets/SFX/ur-glazing.mp3")
	audio.play()
	await audio.finished
	donut.frame = 3
	await get_tree().create_timer(1.5).timeout
	Globals.profit+=10
	switch_to(cofi_scene)

func switch_to(target_scene: Node) -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	visible = false
	target_scene.process_mode = Node.PROCESS_MODE_INHERIT
	target_scene.visible = true
