extends Control

var maze_scene = load("res://Maze/Maze.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_packed(maze_scene)
