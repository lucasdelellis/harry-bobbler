extends Control

var maze_scene = load("res://Maze/Maze.tscn")
var flagg = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready():
	$continuar.hide()
	$continuar/Label.hide()
	$heart.show()
	$mana.show()
	$"Luz corazon".hide()
	$"Luz mana".hide()
	pass
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action") && flagg == 0:
			_on_heart_pressed()
			print("hola")
			
	elif Input.is_action_just_pressed("mana") && flagg == 0:
			_on_mana_pressed()
			print("hola2")
			
	elif Input.is_action_just_pressed("mana") && flagg == 1:
		_on_continuar_pressed()
		print("hola3")
		
	elif Input.is_action_just_pressed("action") && flagg == 1:
		_on_continuar_pressed()
		print("hola4")

	


func _on_mana_pressed() -> void:
		globals.mana += 10
		$continuar.show()
		$continuar/Label.show()
		$heart/heart.hide()
		$heart/Label.hide()
		$"Luz corazon".show()
		$"Luz mana".show()
		$mana/ExtraMana.hide()
		$mana/Label.hide()
		flagg = 1



func _on_heart_pressed() -> void:
		globals.life += 1
		$continuar.show()
		$continuar/Label.show()
		$heart/heart.hide()
		$heart/Label.hide()
		$"Luz corazon".show()
		$"Luz mana".show()
		$mana/ExtraMana.hide()
		$mana/Label.hide()
		flagg = 1



func _on_continuar_pressed() -> void:
	get_tree().change_scene_to_packed(maze_scene)
