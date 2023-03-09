extends Area2D

#Importuje główny skrypt
onready var global = get_node("/root/Global")

#Po wykryciu ciała przywraca całe życie i ustawia global.bounce na true
func _on_Watermelon_body_entered(body):
	global.health = 300 + global.health_rise
	global.bounce = true
	queue_free()
