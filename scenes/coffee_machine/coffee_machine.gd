extends Node2D
@onready var audio = $AudioStreamPlayer
@onready var game = $game
@onready var pregame = $pregame
func _ready():
	game.process_mode = Node.PROCESS_MODE_DISABLED
	#process_mode = Node.PROCESS_MODE_DISABLED
	#visible=false
	pregame.start.connect(start_game)


func start_game(type:String):
	pregame.queue_free()
	game.coffee_type = type
	game.visible = true
	game.process_mode = Node.AUTO_TRANSLATE_MODE_INHERIT
	audio.play()
