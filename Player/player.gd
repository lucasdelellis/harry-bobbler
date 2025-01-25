extends Area2D

signal hit
signal up_generation
signal middle_generation
signal down_generation

@export var speed: int = 10

func _ready() -> void:
	position.x = -144


func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	velocity.x += 1
	velocity = velocity.normalized() * speed
	position += velocity * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		hit.emit()
		print("Hit")
	
	if body.is_in_group("wall"):
		hit.emit()
		print("wall")
	
	# Anadir animacion de golpe	
	print("Colission")


func _on_area_entered(area: Area2D) -> void:
	print("Colission Area")
	
	if area.is_in_group("up_generation"):
		print("Up Generation")
		up_generation.emit()
		
	if area.is_in_group("middle_generation"):
		print("Middle Generation")
		middle_generation.emit()

	if area.is_in_group("down_generation"):
		print("Down Generation")
		down_generation.emit()
