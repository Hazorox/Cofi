extends Node2D

@onready var cut_1: Node2D = $cut1
@onready var cut_2: Node2D = $cut2
@onready var cut_3: Node2D = $cut3
@onready var cut_4: Node2D = $cut4
@onready var iscut1: Area2D = $cut1/Area2D
@onready var iscut2: Area2D = $cut2/Area2D
@onready var iscut3: Area2D = $cut3/Area2D
@onready var iscut4: Area2D = $cut4/Area2D
@onready var dough: AnimatedSprite2D = $AnimatedSprite2D
@onready var apple: AnimatedSprite2D = $AnimatedSprite2D2

@onready var apple_pie_game_scene = get_parent().get_node("ApplePieGame")  # sibling under ApplePie
@onready var camera: Camera2D = apple_pie_game_scene.get_node("Camera2D")

func _ready() -> void:
	dough.stop()
	cut_1.show()
	cut_2.hide()
	cut_3.hide()
	cut_4.hide()
	iscut1.input_event.connect(cut1_clicked)
	iscut2.input_event.connect(cut2_clicked)
	iscut3.input_event.connect(cut3_clicked)
	iscut4.input_event.connect(cut4_clicked)
	apple.visible = false

func cut1_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut_1.hide()
			cut_2.show()
			dough.play("cut")
			await get_tree().create_timer(1.1).timeout
			dough.pause()
			
func cut2_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut_2.hide()
			cut_3.show()
			dough.play("cut")
			await get_tree().create_timer(1.0).timeout
			dough.pause()

func cut3_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut_3.hide()
			cut_4.show()
			dough.play("cut")
			await get_tree().create_timer(1.0).timeout
			dough.pause()
			
func cut4_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut_4.hide()
			dough.play("cut")
			await get_tree().create_timer(0.3).timeout
			dough.pause()
			dough.visible = false
			apple.visible = true
			apple.play("slices")
			await get_tree().create_timer(1.0).timeout
			apple.pause()
			Globals.apple_pie_slices += 4
			print("cut4_clicked finished, switching scene")
			switch_to(apple_pie_game_scene)

func switch_to(next_scene: Node) -> void:
	print("switch_to called with: ", next_scene)
	next_scene.process_mode = Node.PROCESS_MODE_INHERIT
	next_scene.visible = true
	camera.enabled = true
	camera.make_current()
