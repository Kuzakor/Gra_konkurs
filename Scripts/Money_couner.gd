extends Area2D
#Importuje główny skrypt
onready var global = get_node("/root/Global")

func _process(delta):
	$Money_count.text = str(global.money)
	

