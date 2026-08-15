extends Node2D
@export var area2d : Area2D
var contenedor_monedas : contenedorMonedas
func _ready() -> void:
	area2d.body_entered.connect(_recogida)

func _recogida(_body):
	contenedor_monedas.Moneda_Recogida()
	queue_free()
