extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AreaStairs/AnimatedSprite2D.play("portal")


func _on_area_stairs_area_entered(area: Area2D) -> void:
	$AudioStreamPlayer2D.play()
	await $AudioStreamPlayer2D.finished
