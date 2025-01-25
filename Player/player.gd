extends Area2D

signal hit
signal up_generation
signal middle_generation
signal down_generation
signal stairs

var playerPath
var lastPosition
var tween = create_tween()

enum CurrentMovementType{
	MOVE_UP,
	MOVE_MIDDLE,
	MOVE_DOWN
}

var CurrentMovement

@export var speed: int = 10

func _ready() -> void:
	position.x = -144

	CurrentMovement = CurrentMovementType.MOVE_MIDDLE
	tween.tween_property(self,"position",Vector2(position + Vector2(352.0,0.0)),1)


func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	#velocity.x += 1
	#velocity = velocity.normalized() * speed
	#position += velocity * delta
	if Input.is_action_just_pressed("SpawnUp"):
		CurrentMovement = CurrentMovementType.MOVE_UP
	if Input.is_action_just_pressed("SpawnDown"):
		CurrentMovement = CurrentMovementType.MOVE_DOWN

func stairsMovement():
	#playerPath.clear_points()
	print("stairs")
	if CurrentMovement == CurrentMovementType.MOVE_MIDDLE:
		tween = create_tween()
		tween.tween_property(self,"position",Vector2(position + Vector2(352.0,0.0)),1)
	if CurrentMovement == CurrentMovementType.MOVE_UP:
		tween = create_tween()
		var newPosition = position + Vector2(80.0,-64.0)
		tween.tween_property(self,"position",Vector2(newPosition),1)
		tween.tween_property(self,"position",Vector2(newPosition + Vector2(352.0,0.0)),1)
	if CurrentMovement == CurrentMovementType.MOVE_DOWN:
		tween = create_tween()
		var newPosition = position + Vector2(90.0,64.0)
		tween.tween_property(self,"position",Vector2(newPosition),1)
		tween.tween_property(self,"position",Vector2(newPosition + Vector2(352.0,0.0)),1)
	CurrentMovement = CurrentMovementType.MOVE_MIDDLE

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
	if area.is_in_group("stairs"):
		stairsMovement()
