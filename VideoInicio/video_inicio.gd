extends Control

var menu_scene = load("res://Menu/menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_video_inicio_finished() -> void:
	get_tree().change_scene_to_packed(menu_scene)
