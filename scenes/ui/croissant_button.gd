extends TextureButton

@onready var recipes_scene = get_parent()
@onready var cwaso_game_scene = get_parent().get_parent().get_node("CwasoGame")
@onready var cwaso_scene = cwaso_game_scene.get_node("cwaso")

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	switch_to(cwaso_scene)

func switch_to(next_scene: Node) -> void:
	# turn off Recipes
	recipes_scene.process_mode = Node.PROCESS_MODE_DISABLED
	recipes_scene.visible = false

	# turn on ApplePie container
	cwaso_game_scene.process_mode = Node.PROCESS_MODE_INHERIT
	cwaso_game_scene.visible = true

	# disable every sub-scene inside ApplePie first
	for child in cwaso_game_scene.get_children():
		child.process_mode = Node.PROCESS_MODE_DISABLED
		child.visible = false

	# then enable only the target
	next_scene.process_mode = Node.PROCESS_MODE_INHERIT
	next_scene.visible = true
