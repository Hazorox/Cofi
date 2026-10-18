extends Node2D

@onready var coffee_machine:Node2D = $CoffeeMachine
@onready var cofi:Node2D = $Cofi
func _ready():
	coffee_machine.finished.connect(on_coffee_machine_finished)
	
	# Got some help from claude for this interval logic
	var timer := Timer.new()
	timer.wait_time = 180.0
	timer.one_shot = false
	timer.autostart = true
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)

func on_coffee_machine_finished():
	cofi.visible=true
	cofi.process_mode = Node.PROCESS_MODE_INHERIT

func _on_timer_timeout():
	Globals.time+=1
