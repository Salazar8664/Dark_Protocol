class_name contenedorMonedas
extends Node
var _total_monedas: int
var _monedas_recogidas: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var monedas:= get_children() #obtenemos un array (es una lista)
	_total_monedas= monedas.size() #obtenemos el tamaño del array
	
	for moneda in monedas:
		moneda.contenedor_monedas = self


func Moneda_Recogida():
	_monedas_recogidas += 1
	if _monedas_recogidas == _total_monedas:
		print("tamales")
	
