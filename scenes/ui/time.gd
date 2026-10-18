extends HSplitContainer

@onready var timeLabel : Label = $Label
var thing_idk = "PM"
func _ready():
	# Got some help from claude for this interval logic
	var timer := Timer.new()
	timer.wait_time = 20.0
	timer.one_shot = false
	timer.autostart = true
	timer.timeout.connect(_on_timer_timeout)



func _process(_delta:float)->void:
	timeLabel.text = str(Globals.time) + " " + "PM"


func _on_timer_timeout():
	Globals.time+=1
