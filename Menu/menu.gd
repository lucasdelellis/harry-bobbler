extends Control

var maze_scene = load("res://Maze/Maze.tscn")
var instructions_scene = load("res://Menu/instructions.tscn")


func _ready():
	$MenuVideo.show()
	$Play.show()
	$Instructions.show()
	
func _process(delta):
	pass

func _on_instructions_pressed():
	get_tree().change_scene_to_packed(instructions_scene)

func _on_play_pressed():
	globals.life = 3
	globals.mana = 20
	get_tree().change_scene_to_packed(maze_scene)
