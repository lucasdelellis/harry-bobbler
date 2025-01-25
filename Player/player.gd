extends Area2D

signal hit

@export var speed: int = 10

func _ready() -> void:
	var screen_size = get_viewport_rect().size
	position = screen_size / 2


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
