extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var speed : int = 200
var heading := Vector2.DOWN

func _process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	set_animation()

func set_heading() -> void:
	if velocity.x > 0:
		heading = Vector2.RIGHT
	elif velocity.x < 0:
		heading = Vector2.LEFT
	elif velocity.y > 0:
		heading = Vector2.DOWN
	elif velocity.y < 0:
		heading = Vector2.UP

func set_animation() -> void:
	set_heading()
	if velocity.length() == 0 and heading == Vector2.RIGHT:
		animation_player.play("idle_right")
	elif velocity.length() == 0 and heading == Vector2.LEFT:
		animation_player.play("idle_left")
	elif velocity.length() == 0 and heading == Vector2.UP:
		animation_player.play("idle_back")
	elif velocity.length() == 0 and heading == Vector2.DOWN:
		animation_player.play("idle_front")
	elif velocity.length() > 0 and heading == Vector2.RIGHT:
		animation_player.play("walk_right")
	elif velocity.length() > 0 and heading == Vector2.LEFT:
		animation_player.play("walk_left")
	elif velocity.length() > 0 and heading == Vector2.UP:
		animation_player.play("walk_back")
	elif velocity.length() > 0 and heading == Vector2.DOWN:
		animation_player.play("walk_front")
