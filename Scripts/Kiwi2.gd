extends Area2D
#Importuje główny skrypt
onready var global = get_node("/root/Global")

func _on_Kiwi2_body_entered(body):
	if global.long_shield:
		global.shield = 100
	else:
		global.shield = 50
	
	queue_free()
