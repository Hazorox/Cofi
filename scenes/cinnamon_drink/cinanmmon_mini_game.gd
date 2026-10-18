extends Node2D

@onready var texture_progress_bar: TextureProgressBar = $BlendingProgressBar/TextureProgressBar

@onready var game_scene = get_parent().get_parent()
@onready var cofi_scene = game_scene.get_node("Cofi")

var blender_scene : PackedScene = preload("res://scenes/cinnamon_drink/blending_progress.tscn")

var has_switched := false

func _process(_delta: float) -> void:
	texture_progress_bar.value = Globals.blending_progress
	if Globals.blending_progress >= 100 and not has_switched:
		Globals.player_has_cinnamon_drink = true
		has_switched = true
		Globals.profit+=10
		switch_to(cofi_scene)

func _on_blenders_spawning_timer_timeout() -> void:
	var blender = blender_scene.instantiate()
	$Blenders.add_child(blender)

func switch_to(target_scene: Node) -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	visible = false
	target_scene.process_mode = Node.PROCESS_MODE_INHERIT
	target_scene.visible = true
