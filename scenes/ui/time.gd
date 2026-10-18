extends HSplitContainer

@onready var timeLabel : Label = $Label
var thing_idk = "PM"

func _process(_delta:float)->void:
	timeLabel.text = str(Globals.time) + " " + "PM"
