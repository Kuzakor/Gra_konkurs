extends Area2D

#Importuje główny skrypt
onready var global = get_node("/root/Global")


func _on_Watermelon_body_entered(body):
	global.health = 300 + global.health_rise
	global.bounce = true
	queue_free()
