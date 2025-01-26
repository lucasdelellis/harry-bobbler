extends CanvasLayer

@export var heart_image : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update_life(life: int) -> void:
	for child in $LifeBar.get_children():
		child.queue_free()
		
	for i in range(life):
		var heart = heart_image.instantiate()
		$LifeBar.add_child(heart)

func update_mana(mana: int) -> void:
	$Control/Mana.text = str(mana)
