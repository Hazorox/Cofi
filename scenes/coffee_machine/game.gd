extends CanvasLayer

signal finished(hits,mistakes,hits_on_goal)

@export var coffee_type = ""
@export var speed = 120 # amount of degrees per sec
@export var min_radius := 4
@onready var bean:Area2D = $bean2
@onready var bean_collision = $bean2/CollisionShape2D
@onready var green:Area2D = $green_area
@onready var green_collision = $green_area/CollisionShape2D
@onready var green_panel = $green_area/panel
var valid = false # On green spot
var hits := 0
var hits_to_goal :=0
var hits_on_goal := 0
var mistakes :=0
func _ready() -> void:
	# Make valid when both overlap
	green.area_entered.connect(green_entered)
	green.area_exited.connect(green_exited)

func _process(delta: float) -> void:
	# Change speed and hits to win
	match coffee_type:
		"latte":
			speed = 120
			hits_to_goal = 2
		"chocolate":
			speed=180
			hits_to_goal = 4
		"espresso":
			speed=240
			hits_to_goal=6
	
	# Rotate the bean around the centre of Area2D
	bean.rotation_degrees += delta*speed
	
	if Input.is_action_just_pressed("interact"):
		if valid:
			# Rotate the green area to a random location
			green.rotation_degrees= randi_range(-360,360)+40
			
			# Reduce size
			var radius = max(min_radius,green_collision.shape.radius - 1.5)
			green_collision.shape.radius = radius
			bean_collision.shape.radius = max(min_radius,bean_collision.shape.radius - 1.5)
			
			green_panel.size = Vector2.ONE * radius *2
			green_panel.position = green_collision.position - green_panel.size / 2
			hits+=1
			hits_on_goal+=1
			if hits==hits_to_goal:
				finished.emit(hits,mistakes,hits_on_goal)
				visible = false
				process_mode = Node.PROCESS_MODE_DISABLED
		else:
			mistakes += 1
			hits+=1
# Control Valid
func green_entered(Area:Area2D)->void:
	valid = true
func green_exited(Area:Area2D):
	valid = false
