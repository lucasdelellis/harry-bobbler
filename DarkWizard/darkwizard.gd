extends Area2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var atack : PackedScene
var attacked = false

func _on_area_entered(area: Area2D) -> void:
	if not attacked:
		attacked = true
		$ArrowDarkWizard.attack()
		var tween = create_tween()
		tween.tween_property($Sprite2D, "modulate:a", 0, 0.1)


func _on_arrow_dark_wizard_arrow_hit() -> void:
	queue_free()
