extends Node2D
@onready var audio = $AudioStreamPlayer
@onready var game = $game
@onready var pregame = $pregame
func _ready():
	game.process_mode = Node.PROCESS_MODE_DISABLED
	#process_mode = Node.PROCESS_MODE_DISABLED
	#visible=false
	pregame.start.connect(start_game)
	game.finished.connect(on_finished)

func start_game(type:String):
	pregame.queue_free()
	game.coffee_type = type
	game.visible = true
	game.process_mode = Node.AUTO_TRANSLATE_MODE_INHERIT
	audio.play()

func on_finished(hits,mistakes,hits_on_goal)->void:
	var accuracy := 0.0
	if hits > 0:
		accuracy = float(hits_on_goal) / float(hits)
	
	var grade:String
	if accuracy >= 0.9:
		grade = "S"
	elif accuracy >= 0.75:
		grade = "A"
	elif accuracy >= 0.5:
		grade = "B"
	else:
		grade = "C"
	print(grade)
