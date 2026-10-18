extends Node2D
@onready var cake: AnimatedSprite2D = $AnimatedSprite2D
@onready var cookie_col: Area2D = $cookie/Area2D
@onready var cookie: Node2D = $cookie
@onready var cheese: Button = $cheese
@onready var strawberry: Button = $strawberry
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
func _ready() -> void:
	cake.show()
	cake.stop()
	cake.frame = 0 
	cheese.hide()
	strawberry.hide()
	cookie.show()
	cookie_col.input_event.connect(crush)
	cheese.pressed.connect(cheeze)
	strawberry.pressed.connect(jam)

func crush(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cookie.hide()
			audio.stream = load("res://assets/SFX/cookie-crusher.wav")
			audio.play()
			await audio.finished
			cake.frame = 1
			cheese.show()
			
func cheeze():
	cheese.hide()
	audio.stream = load("res://assets/SFX/CHEESE.wav")
	audio.play()
	await audio.finished
	cake.frame = 2
	strawberry.show()

func jam():
	strawberry.hide()
	audio.stream = load("res://assets/SFX/STRAWBWERRY.wav")
	audio.play()
	await audio.finished
	cake.frame = 3
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")
