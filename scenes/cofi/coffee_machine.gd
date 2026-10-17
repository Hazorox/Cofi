extends Area2D

@onready var audio:AudioStreamPlayer2D = $"../../audio"
@onready var audio_path = load("res://assets/audio/encounter.mp3")
@onready var game_scene = get_parent().get_parent().get_parent()
var interactable :=false
@onready var cofi_scene = game_scene.get_node("Cofi")
func _process(_delta:float)->void:
	if Input.is_action_just_pressed("interact") and interactable:
		cofi_scene.process_mode = Node.PROCESS_MODE_DISABLED
		cofi_scene.visible = false

func area_entered(area: Node2D) -> void:
	if area.get_parent().is_in_group("player"):
		audio.stream = audio_path
		audio.global_position = Vector2i(120,10)
		audio.play()
		interactable = true




func area_exited(area: Area2D) -> void:
	if area.get_parent().is_in_group("player"):
		interactable = false
