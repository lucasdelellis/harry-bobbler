extends CharacterBody2D

@export var limite : int

var posicion_inicial: int
var is_visible = true
@export var velocidadX: int

func _ready() -> void:
	posicion_inicial = position.y
	velocity.y = -100
	velocity.x = velocidadX
	print(posicion_inicial)

func _physics_process(delta: float) -> void:
	if position.y <= posicion_inicial-limite:
		velocity.y = 100
		
	if position.y >= posicion_inicial+limite:
		velocity.y = -100
		
	move_and_slide() 

func _on_timer_timeout() -> void:
	is_visible = !is_visible
	$CollisionShape2D.disabled = !$CollisionShape2D.disabled
	
	if is_visible:
		create_tween().tween_property(self,"modulate:a",1,0.1)
	else:
		create_tween().tween_property(self,"modulate:a",0,0.1)

		
	
 
