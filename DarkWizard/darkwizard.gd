extends Area2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var atack : PackedScene


func _ready() -> void:
	var arrow = atack.instantiate()
	add_child(arrow)

func _on_area_entered(area: Area2D) -> void:
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.1)
	await tween.finished
	queue_free()
