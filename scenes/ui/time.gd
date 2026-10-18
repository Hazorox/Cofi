extends HSplitContainer

@onready var timeLabel : Label = $Label
var thing_idk = "PM"
func _process(_delta:float)->void:
	if Globals.time<12:
		thing_idk="AM"
	else:
		thing_idk = "PM"
	timeLabel.text = str(Globals.time) + " " + thing_idk
