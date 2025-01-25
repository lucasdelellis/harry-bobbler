extends Area2D

signal hit
signal up_generation
signal middle_generation
signal down_generation

var playerPath
var lastPosition

enum CurrentMovementType{
	MOVE_UP,
	MOVE_MIDDLE,
	MOVE_DOWN
}

var CurrentMovement

@export var speed: int = 80
var tileSize = 16
var pathLenght = 22
var stairLenght = 4
var pathLenghtInPixel = pathLenght * tileSize

func _ready() -> void:
	position.x = -144

	CurrentMovement = CurrentMovementType.MOVE_MIDDLE
	stairsMovement()


func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_just_pressed("up"):
		CurrentMovement = CurrentMovementType.MOVE_UP
	if Input.is_action_just_pressed("down"):
		CurrentMovement = CurrentMovementType.MOVE_DOWN

func stairsMovement():
	var tween = create_tween()
	var newPosition = position
	
	if CurrentMovement == CurrentMovementType.MOVE_UP:
		newPosition = position + Vector2(80.0,-64.0)
		tween.tween_property(self,"position",newPosition,1)
		
	if CurrentMovement == CurrentMovementType.MOVE_DOWN:
		newPosition = position + Vector2(90.0,64.0)
		tween.tween_property(self,"position", newPosition,1)
		
	print("2")
	tween.tween_property(self,"position", newPosition + Vector2(pathLenghtInPixel, 0), pathLenghtInPixel / 80)
	CurrentMovement = CurrentMovementType.MOVE_MIDDLE

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		hit.emit()
		print("Hit")
	
	if body.is_in_group("wall"):
		hit.emit()
		print("wall")
		
	if body.is_in_group("enemies"):
		hit.emit()
		body.queue_free()
		print("Hit")
	
	
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
		
	if area.is_in_group("enemies"):
		hit.emit()
		area.queue_free()
		print("Hit")
