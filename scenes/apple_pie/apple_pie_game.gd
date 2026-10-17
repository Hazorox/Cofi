extends Node2D

@onready var apple_pie_secne : PackedScene = preload("res://scenes/apple_pie/apple_pie.tscn")
@onready var apple_pie_cooking_bar: Node2D = $ApplePieCookingBar
@onready var cooking_timer: Timer = $CookingTimer
@onready var cooking_progress_bar: TextureProgressBar = $ApplePieCookingBar/TextureProgressBar

var spawn_available := true 
var was_in_oven := false

func _process(_delta: float) -> void:
	if Globals.apple_pie_in_oven and not was_in_oven:
		cooking_timer.start()
		apple_pie_cooking_bar.visible = true
	was_in_oven = Globals.apple_pie_in_oven
	if cooking_progress_bar.value == 100 && spawn_available == true:
		apple_pie_cooked()
		spawn_available = false

func _on_cooking_timer_timeout() -> void:
	cooking_progress_bar.value += 1

func apple_pie_cooked() -> void:
	var apple_pie := apple_pie_secne.instantiate()
	$AppliePie.add_child(apple_pie)
