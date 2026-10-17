extends CanvasLayer

@export var speed = 120 # amount of degrees per sec
@export var min_radius := 4
@onready var bean:Area2D = $bean2
@onready var bean_collision = $bean2/CollisionShape2D
@onready var green:Area2D = $green_area
@onready var green_collision = $green_area/CollisionShape2D
@onready var green_panel = $green_area/panel
var valid = false # On green spot

func _ready() -> void:
	# Make valid when both overlap
	green.area_entered.connect(green_entered)
	green.area_exited.connect(green_exited)

func _process(delta: float) -> void:
	# Rotate the bean around the centre of Area2D
	bean.rotation_degrees += delta*speed
	
	if Input.is_action_just_pressed("interact") and valid:
		# Rotate the green area to a random location
		green.rotation_degrees= randi_range(-360,360)+40
		
		# Reduce size
		green_panel.size = green_panel.size - Vector2(5,5)
		green_collision.shape.radius = max(min_radius, green_collision.shape.radius-1.5)
		bean_collision.shape.radius  = max(min_radius,bean_collision.shape.radius-1.5)

# Control Valid
func green_entered(Area:Area2D)->void:
	valid = true
func green_exited(Area:Area2D):
	valid = false
