extends Area2D

@export var speed : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Mueve el objeto hacia la izquierda
	global_position.x -= speed * delta
