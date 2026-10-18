extends TextureButton

@onready var recipes_scene = get_parent()
@onready var apple_pie_scene = get_parent().get_parent().get_node("ApplePie")
@onready var apple_cut_scene = apple_pie_scene.get_node("AppleCut")

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	switch_to(apple_cut_scene)

func switch_to(next_scene: Node) -> void:
	# turn off Recipes
	recipes_scene.process_mode = Node.PROCESS_MODE_DISABLED
	recipes_scene.visible = false

	# turn on ApplePie container
	apple_pie_scene.process_mode = Node.PROCESS_MODE_INHERIT
	apple_pie_scene.visible = true

	# disable every sub-scene inside ApplePie first
	for child in apple_pie_scene.get_children():
		child.process_mode = Node.PROCESS_MODE_DISABLED
		child.visible = false

	# then enable only the target
	next_scene.process_mode = Node.PROCESS_MODE_INHERIT
	next_scene.visible = true
