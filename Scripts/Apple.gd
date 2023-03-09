extends Area2D

#Importuje główny skrypt
onready var global = get_node("/root/Global")

#Gdy ciało wejdzie w obszar ustawia globalna zmienna jump_boost na true i ususwa siebie
func _on_Apple_body_entered(body):
	global.jump_boost = true
	queue_free() 


