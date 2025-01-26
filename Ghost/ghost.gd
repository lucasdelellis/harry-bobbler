extends CharacterBody2D

@export var limite : int

var posicion_inicial: int
var is_visible = true
@export var velocidadX: int

func _ready() -> void:
	posicion_inicial = position.y
	velocity.y = -300
	velocity.x = velocidadX

func _physics_process(delta: float) -> void:
	if position.y <= posicion_inicial-limite:
		velocity.y = 300
		
	if position.y >= posicion_inicial+limite:
		velocity.y = -300
		
	move_and_slide() 

func _on_timer_timeout() -> void:
	is_visible = !is_visible
	$CollisionShape2D.disabled = !$CollisionShape2D.disabled
	
	if is_visible:
		create_tween().tween_property(self,"modulate:a",1,0.1)
	else:
		create_tween().tween_property(self,"modulate:a",0.2,0.1)

		
	
 
