extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var atack : PackedScene


func _ready() -> void:
	var A = atack.instantiate()
	add_child(A)
	

func _physics_process(delta: float) -> void:


	move_and_slide()


func _on_timer_timeout() -> void:
	var A = atack.instantiate()
	add_child(A)
