extends Area2D
#Importuje główny skrypt
onready var global = get_node("/root/Global")

#Gdy ciało wejdzie w obszar ustawia zmienna global.shield na 100 lub 50 w zależoności czy global.long_shield jest prawda czy nie
func _on_Kiwi2_body_entered(body):
	if global.long_shield:
		global.shield = 100
	else:
		global.shield = 50
	
	queue_free()
