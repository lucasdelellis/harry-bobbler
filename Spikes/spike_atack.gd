extends CharacterBody2D


var jugador : Node2D
@export var distancia : int
@export var spikespeed : int


func _physics_process(delta: float) -> void:
	if (position.x - jugador.position.x) <= distancia:
		#print("Cae")
		velocity.y = spikespeed 


	move_and_slide()
