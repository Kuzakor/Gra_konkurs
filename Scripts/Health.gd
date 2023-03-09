extends RigidBody2D


#Importuje główny skrypt
onready var global = get_node("/root/Global")


func _process(delta):
	#Ustawia klatke animacji zdrowia
	$AnimatedSprite.set_frame(6 - global.health/50)
	#Przekierowuje do sceny "koniec gry" gdy zdrowie jest mniejsze od 0
	if global.health < 0:
		get_tree().change_scene("res://Scenes/You dead screen.tscn")

