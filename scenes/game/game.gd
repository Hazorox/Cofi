extends Node2D

@onready var coffee_machine:Node2D = $CoffeeMachine
@onready var cofi:Node2D = $Cofi
func _ready():
	coffee_machine.finished.connect(on_coffee_machine_finished)

func on_coffee_machine_finished():
	cofi.visible=true
	cofi.process_mode = Node.PROCESS_MODE_INHERIT
