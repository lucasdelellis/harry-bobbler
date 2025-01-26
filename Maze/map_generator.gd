extends Node2D

var mazeBlockCommon = preload("res://Maze/MapBlockCommon.tscn")
var mazeBlockUp = preload("res://Maze/MapBlockUp.tscn")
var mazeBlockMiddle = preload("res://Maze/MapBlockMiddle.tscn")
var mazeBlockDown = preload("res://Maze/MapBlockDown.tscn")
var mazeBlockFinal = preload("res://Maze/MapBlockFinal.tscn")

var main_scene = preload("res://Menu/menu.tscn")

@export var win_scene : PackedScene
@export var power_ups : PackedScene
@export var lose_scene : PackedScene
@export var max_blocks_per_level : int

var tileSize = 16
var pathLenght = 28

var currentGen

var lastCrossPosition

enum DirectionType {
	UP,
	MIDDLE,
	DOWN
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Gameplay.play()
	var blockInstance = mazeBlockCommon.instantiate()
	add_child(blockInstance)
	lastCrossPosition = Vector2(0.0,0.0)
	currentGen=0
	
	$HUD.update_life(globals.life)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var mana_percentage = $Player.current_mana * 100 / globals.mana
	$HUD.update_mana(mana_percentage)
	
func SpawnNewBlock(direction : DirectionType):
	var newPosition = Vector2.ZERO
	newPosition.x += tileSize * pathLenght
	var blockReference: PackedScene
	
	if direction == DirectionType.UP:
		blockReference = mazeBlockUp
		newPosition.y -= tileSize * 4
	elif direction == DirectionType.MIDDLE:
		blockReference = mazeBlockMiddle
	elif direction == DirectionType.DOWN:
		blockReference = mazeBlockDown
		newPosition.y += tileSize * 4
		
	if currentGen >= max_blocks_per_level:
		blockReference = mazeBlockFinal

	var blockInstance = blockReference.instantiate()
	add_child(blockInstance)
	lastCrossPosition += newPosition
	blockInstance.position = lastCrossPosition
	
	if currentGen < max_blocks_per_level:
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


func _on_player_portal_entered() -> void:
	if globals.nivel <= 3:
		globals.nivel += 1
		globals.speed += 30
		get_tree().change_scene_to_packed(power_ups)
	else:
		get_tree().change_scene_to_packed(win_scene)
	
