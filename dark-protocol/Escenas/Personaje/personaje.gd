extends CharacterBody2D
@export var animacion : AnimatedSprite2D
@export var area_2d : Area2D
@export var Material_Personaje_rojo: ShaderMaterial
signal PersonajeMuerto
var _velocidad: float = 110.0 
var _velocidad_salto: float = -400
var _Muerto: bool
#variables control buffer
var tocando_suelo: bool = false
@export var duraciom_buffer_salto:float = 0.15
func _ready():
	add_to_group("Personajes")
	area_2d.body_entered.connect(_on_area_2d_body_entered)
	
	
func _physics_process(delta):
	if _Muerto:
		return
	#gravedad
	velocity += get_gravity() * delta
	#salto
	if Input.is_action_just_pressed("saltar"):
		if is_on_floor():
			velocity.y = _velocidad_salto
		else:
			print("salto programado al tocar el suelo = true")
			tocando_suelo = true
	#velosidad
	if Input.is_action_pressed("dereha"):
		velocity.x = _velocidad
		animacion.flip_h = false
	elif Input.is_action_pressed("izquierda"):
		velocity.x = -_velocidad
		animacion.flip_h = true
	else:
		velocity.x = 0
	move_and_slide()
	#animacion
	if !is_on_floor():
		if velocity.y < 0:
			animacion.play("saltar")
		else:
			animacion.play("caer")
	elif velocity.x !=0:
		animacion.play("Correr")
	else:
		animacion.play("idle")


func _on_area_2d_body_entered(_body: Node2D) -> void:
	animacion.material =  Material_Personaje_rojo
	_Muerto = true
	animacion.stop()
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.start(0.5)
	await timer.timeout
	PersonajeMuerto.emit()
	
	
	
	
	
