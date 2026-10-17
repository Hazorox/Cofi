extends Area2D

@onready var audio:AudioStreamPlayer2D = $"../../../audio"
@onready var audio_path = load("res://assets/audio/encounter.mp3")

func area_entered(area: Node2D) -> void:
	print(area.get_parent())
	if area.get_parent().is_in_group("player"):
		audio.stream = audio_path
		audio.global_position = Vector2i(120,10)
		audio.play()
		
