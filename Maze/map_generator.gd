extends Node2D

var mazeBlockCommon = preload("res://Maze/MapBlockCommon.tscn")
var mazeBlockUp = preload("res://Maze/MapBlockUp.tscn")
var mazeBlockMiddle = preload("res://Maze/MapBlockMiddle.tscn")
var mazeBlockDown = preload("res://Maze/MapBlockDown.tscn")
var mazeBlockFinal = preload("res://Maze/MapBlockFinal.tscn")

@export var jugador : Area2D
@export var win_scene : PackedScene
@export var lose_scene : PackedScene

var tileSize = 16
var pathLenght = 22

var currentGen

var lastCrossPosition

enum DirectionType {
	UP,
	MIDDLE,
	DOWN
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var blockInstance = mazeBlockCommon.instantiate()
	add_child(blockInstance)
	lastCrossPosition = Vector2(0.0,0.0)
	currentGen=0
	
	$HUD.update_life(globals.life)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var mana_percentage = $Player.current_mana * 100 / $Player.mana
	$HUD.update_mana(mana_percentage)
	
func SpawnNewBlock(direction : DirectionType):                     
	if currentGen >= 3 :
		get_tree().change_scene_to_packed(win_scene)
		return

	var blockInstance
	if direction == DirectionType.UP:
		lastCrossPosition = Vector2(lastCrossPosition.x+ 352.0, lastCrossPosition.y +  -64.0)
		blockInstance = mazeBlockUp.instantiate()
	elif direction == DirectionType.MIDDLE:
		lastCrossPosition = Vector2(lastCrossPosition.x+ 352.0, lastCrossPosition.y + 0.0)
		blockInstance = mazeBlockMiddle.instantiate()
	elif direction == DirectionType.DOWN:
		lastCrossPosition = Vector2(lastCrossPosition.x+ 352.0, lastCrossPosition.y + 64.0)
		blockInstance = mazeBlockDown.instantiate()
		
	add_child(blockInstance)
	blockInstance.position = lastCrossPosition
	$Spawn.Spawn(blockInstance,currentGen)
	currentGen+=1	


func _on_player_up_generation() -> void:
	SpawnNewBlock(DirectionType.UP)


func _on_player_middle_generation() -> void:
	SpawnNewBlock(DirectionType.MIDDLE)


func _on_player_down_generation() -> void:
	SpawnNewBlock(DirectionType.DOWN)


func _on_player_stairs() -> void:
	pass # Replace with function body.


func _on_player_hit() -> void:
	$HUD.update_life(globals.life)


func _on_player_game_over() -> void:
	get_tree().change_scene_to_packed(lose_scene)
