extends CharacterBody2D


var jugador : Node2D
@export var distancia : int
@export var spikespeed : int

func _physics_process(delta: float) -> void:
	var in_x_range = (position.x - jugador.position.x) <= distancia
	var in_y_range = (jugador.position.y - position.y) <= 30 and (jugador.position.y - position.y) > 0
	
	if in_x_range and in_y_range:
		velocity.y = spikespeed 
		
	move_and_slide()
