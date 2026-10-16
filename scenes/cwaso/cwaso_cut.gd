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
func _ready() -> void:
	dough.stop()
	cut_1.show()
	cut_2.hide()
	cut_3.hide()
	cut_4.hide()
	cut_5.hide()
	iscut1.input_event.connect(cut1_clicked)
	iscut2.input_event.connect(cut2_clicked)
	iscut3.input_event.connect(cut3_clicked)
	iscut4.input_event.connect(cut4_clicked)
	iscut5.input_event.connect(cut5_clicked)


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
			cut_5.show()
			dough.play("cut")
			await get_tree().create_timer(1.0).timeout
			dough.pause()

func cut5_clicked(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cut_5.hide()
			dough.play("cut")
			await get_tree().create_timer(1.0).timeout
			get_tree().change_scene_to_file("res://scenes/cofi/cofi.tscn")
