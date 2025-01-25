extends Node2D


var mazeBlockCommon
var mazeBlockUp
var mazeBlockMiddle
var mazeBlockDown

var tileSize = 16
var pathLenght = 22

var lastCrossPosition

enum DirectionType {
	UP,
	MIDDLE,
	DOWN
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mazeBlockCommon = load("res://Maze/MapBlockCommon.tscn")
	mazeBlockUp = load("res://Maze/MapBlockUp.tscn")
	mazeBlockMiddle = load("res://Maze/MapBlockMiddle.tscn")
	mazeBlockDown = load("res://Maze/MapBlockDown.tscn")
	var blockInstance = mazeBlockCommon.instantiate()
	add_child(blockInstance)
	lastCrossPosition = Vector2(0.0,0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func SpawnNewBlock(direction : DirectionType):
	var blockInstance
	#lastCrossPosition = Vector2(lastCrossPosition.x + tileSize * pathLenght, lastCrossPosition.y)
	if direction == DirectionType.UP:
		lastCrossPosition = Vector2(lastCrossPosition.x+ 352.0,lastCrossPosition.y +  -64.0)
		blockInstance = mazeBlockUp.instantiate()
	elif direction == DirectionType.MIDDLE:
		lastCrossPosition = Vector2(lastCrossPosition.x+ 352.0,lastCrossPosition.y + 0.0)
		blockInstance = mazeBlockMiddle.instantiate()
	elif direction == DirectionType.DOWN:
		lastCrossPosition = Vector2(lastCrossPosition.x+ 352.0,lastCrossPosition.y + 64.0)
		blockInstance = mazeBlockDown.instantiate()
		

	add_child(blockInstance)
	blockInstance.position = lastCrossPosition
		
		
	


func _on_player_up_generation() -> void:
	SpawnNewBlock(DirectionType.UP)


func _on_player_middle_generation() -> void:
	SpawnNewBlock(DirectionType.MIDDLE)


func _on_player_down_generation() -> void:
	SpawnNewBlock(DirectionType.DOWN)


func _on_player_stairs() -> void:
	pass # Replace with function body.
