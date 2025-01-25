extends Area2D


func _ready() -> void:
	deactivate()


func _process(delta: float) -> void:
	if Input.is_action_pressed("action"):
		activate()
	else:
		deactivate()

func activate() -> void:
	show()
	set_collision_mask_value(2, true)
	
func deactivate() -> void:
	hide()
	set_collision_mask_value(2, false)



func _on_area_entered(area: Area2D) -> void:
	print("Bubble")
	area.hide()
	area.queue_free()
