extends Control

var maze_scene = load("res://Maze/Maze.tscn")
var flagg = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready():
	$continuar.hide()
	$continuar/Label.hide()
	$heart.show()
	$mana.show()
	pass
	

func _process(delta: float) -> void:
		
	pass

	


func _on_mana_pressed() -> void:
	if flagg == 0:
		globals.mana += 10
		$continuar.show()
		$continuar/Label.show()
		$heart/heart.hide()
		$heart/Label.hide()
		$mana/ExtraMana.hide()
		$mana/Label.hide()
		flagg = 1


func _on_heart_pressed() -> void:
	if flagg == 0:
		globals.life += 1
		$continuar.show()
		$continuar/Label.show()
		$heart/heart.hide()
		$heart/Label.hide()
		$mana/ExtraMana.hide()
		$mana/Label.hide()
		flagg = 1


func _on_continuar_pressed() -> void:
	get_tree().change_scene_to_packed(maze_scene)
