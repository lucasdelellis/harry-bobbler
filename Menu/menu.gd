extends Control

var maze_scene = load("res://Maze/Maze.tscn")
var loop : bool = true

func _ready():
	$MenuVideo.hide()
	$Button.hide()
	$IntroVideo.play()
	
func _process(delta):
	if !$IntroVideo.is_playing() && loop:
		$MenuVideo.show()
		$MenuVideo.play()		
		$Button.show()
		loop = false
	pass

func _on_button_pressed():
	get_tree().change_scene_to_packed(maze_scene)
