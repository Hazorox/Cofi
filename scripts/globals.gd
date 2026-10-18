extends Node

var apple_pie_slices := 0
var apple_pie_slices_in_pot := 0
var cinnamon_in_apple_pot := 0
var butter_in_apple_pot := false
var milk_in_apple_pot := false
var apple_pie_in_oven := false
var player_has_apple_pie := false
var cinnamon_drink_apple_slices := 0
var cinnamon_drink_milk := 0
var cinnamon_drink_sugar_cubes := 0
var cinnamon_drink_cinammon_sticks := 0
var blending_progress := 0
var player_has_cinnamon_drink := false
var target = "coffee"
var time := 12
var profit := 0
func _ready():
	# Got some help from claude for this interval logic
	var timer := Timer.new()
	timer.wait_time = 20.0
	timer.one_shot = false
	timer.autostart = true
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)

func _on_timer_timeout():
	time+=1
	if time==24:
		time=12
