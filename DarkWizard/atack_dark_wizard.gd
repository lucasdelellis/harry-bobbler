extends Area2D

signal arrow_hit

@export var speed : int
var is_attacking: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_attacking = false
	$Sprite2D.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_attacking:
		# Mueve el objeto hacia la izquierda
		global_position.x -= speed * delta

func attack() -> void:
	is_attacking = true
	$Sprite2D.visible = true


func _on_tree_exited() -> void:
	arrow_hit.emit()
