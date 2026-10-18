extends HSplitContainer

@onready var profit:Label = $Label

func _process(_delta: float) -> void:
	profit.text = str(Globals.profit)
