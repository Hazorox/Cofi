extends TextureButton

@onready var recipes_scene = get_parent()
@onready var machine_scene = get_parent().get_parent().get_node("CoffeeMachine")

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	switch_to(machine_scene)

func switch_to(next:Node)->void:
	recipes_scene.process_mode = Node.PROCESS_MODE_DISABLED
	recipes_scene.visible = false
	
	next.process_mode = Node.PROCESS_MODE_INHERIT
	next.visible = true
