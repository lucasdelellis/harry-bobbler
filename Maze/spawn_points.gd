extends Node2D

@export var up1 : Node2D
@export var up2 : Node2D
@export var up3 : Node2D

@export var middle1 : Node2D
@export var middle2 : Node2D
@export var middle3 : Node2D

@export var down1 : Node2D
@export var down2 : Node2D
@export var down3 : Node2D

var upNodes
var middleNodes
var downNodes

var testAsd



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	upNodes = [up1,up2,up3]
	middleNodes = [middle1,middle2,middle3]
	downNodes = [down1,down2,down3]
	testAsd = "funciona????"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
