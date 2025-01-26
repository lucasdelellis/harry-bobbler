extends Control

var menu_scene = load("res://Menu/menu.tscn")

func _ready():
	$VideoStreamPlayer.play()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(menu_scene)
