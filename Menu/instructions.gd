extends Control

var menu_scene = load("res://Menu/menu.tscn")

func _ready():
	$Story.text = "La escuela de magia está bajo ataque y queda en manos del legendario mago Harry Bubbler salvar el día. Pero... la edad hizo estragos en él. Su amnesia lo dejó con un único hechizo: la burbuja protectora."
	
func _on_button_pressed():
		get_tree().change_scene_to_packed(menu_scene)
