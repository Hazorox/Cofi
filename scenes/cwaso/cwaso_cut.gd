extends Node2D

@onready var cut_1: Node2D = $cut1
@onready var cut_2: Node2D = $cut2
@onready var cut_3: Node2D = $cut3
@onready var cut_4: Node2D = $cut4
@onready var cut_5: Node2D = $cut5
@onready var iscut1: Area2D = $cut1/Area2D
@onready var iscut2: Area2D = $cut2/Area2D
@onready var iscut3: Area2D = $cut3/Area2D
@onready var iscut4: Area2D = $cut4/Area2D
@onready var iscut5: Area2D = $cut5/Area2D
@onready var dough: AnimatedSprite2D =$AnimatedSprite2D
@onready var roll: Button = $roll
@onready var cwasos: Node2D = $cwasos
@onready var cooked: Node2D = $cooked_cwasos
@onready var oven: Button = $oven
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var game_scene = get_parent().get_parent()
@onready var cofi_scene = game_scene.get_node("Cofi")

func _ready() -> void:
	Input.set_custom_mouse_cursor(preload("res://assets/icons/icons/icon2.png"), Input.CURSOR_ARROW, Vector2(8,8))
	dough.stop()
	cut_1.show()
	cut_2.hide()
	cut_3.hide()
	cut_4.hide()
	cut_5.hide()
	roll.hide()
	cwasos.hide()
	oven.hide()
	cooked.hide()
	iscut1.input_event.connect(cut1_clicked)
	iscut2.input_event.connect(cut2_clicked)
	iscut3.input_event.connect(cut3_clicked)
	iscut4.input_event.connect(cut4_clicked)
	iscut5.input_event.connect(cut5_clicked)
	roll.pressed.connect(roll_cwaso)
	oven.pressed.connect(cinnamon_oven)


func cut1_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut_1.hide()
			dough.play("cut")
			await get_tree().create_timer(1.1).timeout
			dough.pause()
			cut_2.show()
			
func cut2_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut_2.hide()
			dough.play("cut")
			await get_tree().create_timer(1.0).timeout
			dough.pause()
			cut_3.show()

func cut3_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut_3.hide()
			dough.play("cut")
			await get_tree().create_timer(1.0).timeout
			dough.pause()
			cut_4.show()
			
func cut4_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut_4.hide()
			dough.play("cut")
			await get_tree().create_timer(1.0).timeout
			dough.pause()
			cut_5.show()

func cut5_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut_5.hide()
			dough.play("cut")
			await get_tree().create_timer(1.0).timeout
			dough.pause()
			roll.show()
			
func roll_cwaso():
	roll.hide()
	dough.hide()
	cwasos.show()
	oven.show()
	
func cinnamon_oven():
	audio.play()
	cwasos.hide()
	oven.hide()
	await audio.finished
	cooked.show()
	await get_tree().create_timer(1.0).timeout
	switch_to(cofi_scene)

func switch_to(target_scene: Node) -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	visible = false
	target_scene.process_mode = Node.PROCESS_MODE_INHERIT
	target_scene.visible = true
