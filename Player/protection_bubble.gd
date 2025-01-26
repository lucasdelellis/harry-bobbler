extends Area2D

signal bubble_protection_activate
signal bubble_protection_deactivate

@export var consumption: int
var enabled: bool

func _ready() -> void:
	enabled = true
	deactivate()


func _process(delta: float) -> void:
	if enabled:
		if Input.is_action_just_pressed("action"):
				activate()
		elif Input.is_action_just_released("action"):
			deactivate()

func activate() -> void:
	show()
	$ActivateSound.play()
	set_collision_mask_value(2, true)
	bubble_protection_activate.emit()
	
func deactivate() -> void:
	hide()
	$ActivateSound.stop()
	$DeactivateSound.play()
	set_collision_mask_value(2, false)
	bubble_protection_deactivate.emit()



func _on_area_entered(area: Area2D) -> void:
	area.hide()
	area.queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.hide()
	body.queue_free()
