extends Control

var maze_scene = load("res://Maze/Maze.tscn")


func _ready():
	$MenuVideo.show()
	$Button.show()
	
func _process(delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_packed(maze_scene)
