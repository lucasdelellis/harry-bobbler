extends Control

var menu_scene = load("res://Menu/menu.tscn")

func _on_button_pressed():
		get_tree().change_scene_to_packed(menu_scene)
