extends HSplitContainer

@onready var timeLabel : Label = $Label

func _process(_delta:float)->void:
	timeLabel.text = str(Globals.time) + ":00"
