extends Node2D

@onready var texture_progress_bar: TextureProgressBar = $BlendingProgressBar/TextureProgressBar

var blender_scene : PackedScene = preload("res://scenes/cinnamon_drink/blending_progress.tscn")
 
func _process(_delta: float) -> void:
	texture_progress_bar.value = Globals.blending_progress
	

func _on_blenders_spawning_timer_timeout() -> void:
	var blender = blender_scene.instantiate()
	$Blenders.add_child(blender)
