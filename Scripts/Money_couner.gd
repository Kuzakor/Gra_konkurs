extends Area2D
#Importuje główny skrypt
onready var global = get_node("/root/Global")

#Ustawia text money_count na wartośc zebranych pieniedzy (global.money) 
func _process(delta):
	$Money_count.text = str(global.money)
	

