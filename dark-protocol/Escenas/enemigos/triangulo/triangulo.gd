extends Area2D

const SPEED = 100.0
var direction = -1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Area2D.body_entered.connect(_recibedaño)
func _recibedaño():
	pass


# pero que demonios estyo leyendo
func _process(delta: float) -> void:
	position.x += direction * SPEED * delta


func _on_timer_timeout() -> void:
	direction *= -1
