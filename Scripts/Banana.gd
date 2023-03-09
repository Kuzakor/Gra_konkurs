extends Area2D
#Importuje główny skrypt
onready var global = get_node("/root/Global")

#Gdy ciało wejdzie w obszar ustawia wybrane globalne zmienne na false
func _on_Banana_body_entered(body):
	global.bounce = false
	global.reverse = false
	global.jump_boost = false
	queue_free()
	

