extends Node2D
signal finished
@onready var audio = $AudioStreamPlayer
@onready var game = $game
@onready var pregame = $pregame
@onready var canvases = [$pregame,$game,$bg,$result]
@onready var result = $result
func _ready():
	game.process_mode = Node.PROCESS_MODE_DISABLED
	#process_mode = Node.PROCESS_MODE_DISABLED
	#visible=false
	pregame.start.connect(start_game)
	game.finished.connect(on_finished)

func start_game(type:String):
	for canvas in canvases:
		canvas.layer = 40
	pregame.queue_free()
	game.coffee_type = type
	game.visible = true
	game.process_mode = Node.AUTO_TRANSLATE_MODE_INHERIT
	audio.play()

func on_finished(hits,hits_on_goal)->void:
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
	result.grade = grade
	print("finished")
	await get_tree().create_timer(4).timeout
	visible=false
	print("entire thing hidden")
	for canvas in canvases:
		if is_instance_valid(canvas):
			canvas.layer = -30
			canvas.visible = false
	print("canvas hidden")
	finished.emit()
	print("finished emitted")
	process_mode=Node.PROCESS_MODE_DISABLED
