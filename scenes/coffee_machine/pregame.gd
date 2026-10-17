extends CanvasLayer

signal start(type)
@onready var buttons : Array[Button] = [$buttons/latte,$buttons/chocolate,$buttons/espresso]
var focused = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("down"):
		match focused:
			null:
				focused = 0
			0:
				focused =1
			1:
				focused = 2
			2:
				focused =0
		buttons[focused].grab_focus()
	elif Input.is_action_just_pressed("up"):
		match focused:
			null:
				focused = 0
			0:
				focused = 2
			1:
				focused = 0
			2:
				focused =1
		buttons[focused].grab_focus()


func _on_latte_pressed() -> void:
	start.emit("latte")


func _on_chocolate_pressed() -> void:
	start.emit("choco")

func _on_espresso_pressed() -> void:
	start.emit("espresso")
