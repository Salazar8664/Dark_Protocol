extends RigidBody2D
@export var area2d : Area2D
@export var Animacion : AnimationPlayer
@export var piso : Area2D
var suelo : bool = false
func _ready() -> void:
	area2d.body_entered.connect(_caer)
	
func  _caer(_body):
	if suelo:
		print("calajo")
		return
		
	else:
		suelo = true
		Animacion.play("Temblar")
		await get_tree().create_timer(2.0).timeout
		Animacion.stop()
		print("nanaananan")
		freeze = false

	
	#tiene un error donde la animacion se reporduce otra ves incluso depues de caer
