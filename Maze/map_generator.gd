extends Node2D


var mazeBlockCommon
var mazeBlockUp
var mazeBlockMiddle
var mazeBlockDown

var direction
var lastCrossPosition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mazeBlockCommon = load("res://Maze/MapBlockCommon.tscn")
	mazeBlockUp = load("res://Maze/MapBlockUp.tscn")
	mazeBlockMiddle = load("res://Maze/MapBlockMiddle.tscn")
	mazeBlockDown = load("res://Maze/MapBlockDown.tscn")
	var blockInstance = mazeBlockCommon.instantiate()
	add_child(blockInstance)
	direction = 0
	lastCrossPosition = Vector2(0.0,0.0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("SpawnUp"):
		direction = 1
		SpawnNewBlock()
	
	if Input.is_action_just_pressed("SpawnMiddle"):
		direction = 0
		SpawnNewBlock()
		
	if Input.is_action_just_pressed("SpawnDown"):
		direction = -1
		SpawnNewBlock()	
	pass
	
func SpawnNewBlock():
	var blockInstance
	if direction == 1:
		lastCrossPosition = Vector2(lastCrossPosition.x+ 352.0,lastCrossPosition.y +  -64.0)
		blockInstance = mazeBlockUp.instantiate()
	elif direction ==0:
		lastCrossPosition = Vector2(lastCrossPosition.x+ 352.0,lastCrossPosition.y + 0.0)
		blockInstance = mazeBlockMiddle.instantiate()
	elif direction ==-1:
		lastCrossPosition = Vector2(lastCrossPosition.x+ 352.0,lastCrossPosition.y + 64.0)
		blockInstance = mazeBlockDown.instantiate()
		

	add_child(blockInstance)
	blockInstance.position = lastCrossPosition
		
		
	
