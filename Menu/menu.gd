extends Control

var maze_scene = load("res://Maze/Maze.tscn")

func _ready():
	$MenuVideo.show()
	$Play.show()
	$Instructions.show()
	$BackToMenu.hide()
	$InstLabels.visible = false
	$InstructionsBackG.visible = false

func _on_instructions_pressed():
	$MenuVideo.visible = false
	$Play.hide()
	$Instructions.hide()
	$BackToMenu.show()
	$InstructionsBackG.visible = true
	$InstLabels.visible = true
	
func _on_play_pressed():
	globals.life = 3
	get_tree().change_scene_to_packed(maze_scene)

func _on_back_to_menu_pressed():
	$MenuVideo.visible = true
	$Play.show()
	$BackToMenu.hide()
	$Instructions.show()
	$InstructionsBackG.visible = false
	$InstLabels.visible = false	
