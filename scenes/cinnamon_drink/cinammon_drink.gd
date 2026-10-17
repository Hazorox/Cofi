extends Node2D

@onready var timer_to_restart: Timer = $TimerToRestart
@onready var label: Label = $Label

var cinammon_sticks_scene : PackedScene = preload("res://scenes/apple_pie/cinnamon_sticks.tscn")
var milk_scene : PackedScene = preload("res://scenes/apple_pie/milk.tscn")
var apple_slice_scene : PackedScene = preload("res://scenes/apple_pie/apple_slice.tscn")
var sugar_cube_scene : PackedScene = preload("res://scenes/cinnamon_drink/sugar_cube.tscn")

func _ready() -> void:
	for i in range(2):
		var milk_instance = milk_scene.instantiate()
		$Ingerdients.add_child(milk_instance)
		milk_instance.position = Vector2(randi_range(10, 630), randi_range(10, 340))
	for i in range(4):
		var sugar_instance = sugar_cube_scene.instantiate()
		$Ingerdients.add_child(sugar_instance)
		sugar_instance.position = Vector2(randi_range(10, 630), randi_range(10, 340))
	for i in range(4):
		var apple_instance = apple_slice_scene.instantiate()
		$Ingerdients.add_child(apple_instance)
		apple_instance.position = Vector2(randi_range(10, 630), randi_range(10, 340))
	for i in range(1):
		var cinnamon_instance = cinammon_sticks_scene.instantiate()
		$Ingerdients.add_child(cinnamon_instance)
		cinnamon_instance.position = Vector2(randi_range(10, 630), randi_range(10, 340))

func _process(_delta: float) -> void:
	label.text = str("Time Till Restart: ", int(timer_to_restart.time_left))

func _on_timer_to_restart_timeout() -> void:
	get_tree().reload_current_scene()
