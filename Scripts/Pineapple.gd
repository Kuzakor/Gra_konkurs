extends Area2D
#Importuje główny skrypt
onready var global = get_node("/root/Global")



func _on_Pineapple_body_entered(body):
	global.health = 300 + global.health_rise
	global.reverse = true
	queue_free()
