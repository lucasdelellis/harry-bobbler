extends Area2D


func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	if Input.is_action_pressed("action"):
		show()
	else:
		hide()
