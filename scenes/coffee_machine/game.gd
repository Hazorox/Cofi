extends CanvasLayer

@onready var bean:Area2D = $orbit/bean2
@onready var green:Area2D = $green_area
@export var speed := 1.5 # Tangential Speed
@export var center = Vector2(482,145) # Circle center
@export var radius := 80.0 # Circle radius
var angle := 0.0

func _ready() -> void:
	green.area_entered.connect(green_entered)

func _process(delta: float) -> void:
	angle += speed*delta
	bean.global_position = center + Vector2(cos(angle),sin(angle)) * radius


func green_entered(Area:Area2D)->void:
	print("TOUCHED")
