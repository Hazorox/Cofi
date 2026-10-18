extends Node2D
signal finished
@onready var audio = $AudioStreamPlayer
@onready var game = $game
@onready var pregame = $pregame
@onready var canvases:Array[CanvasLayer] = [$pregame,$game,$bg,$result]
@onready var result = $result
var initial = {}
func _ready():
	for canvas in canvases:
		initial[canvas] = {"layer":canvas.layer,"visible":canvas.visible}
	pregame.start.connect(start_game)
	game.finished.connect(on_finished)
	visibility_changed.connect(_on_visibility_changed)
	_reset()

func _on_visibility_changed():
	if visible:
		_reset()


func _reset():
	for canvas in canvases:
		canvas.layer = initial[canvas]["layer"]
		canvas.visible = initial[canvas]["visible"]
	game.reset()
	game.process_mode = Node.PROCESS_MODE_DISABLED
	pregame.focused = null
	pregame.process_mode = Node.AUTO_TRANSLATE_MODE_INHERIT
	pregame.visible = true

func start_game(type:String):
	for canvas in canvases:
		canvas.layer = 60
		canvas.visible=true
	pregame.visible = false
	pregame.process_mode = Node.PROCESS_MODE_DISABLED
	game.coffee_type = type
	game.process_mode = Node.PROCESS_MODE_INHERIT
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
	await get_tree().create_timer(4).timeout
	visible=false
	for canvas in canvases:
		if is_instance_valid(canvas):
			canvas.layer = -30
			canvas.visible = false
	Globals.profit+=10
	finished.emit()
	process_mode=Node.PROCESS_MODE_DISABLED
