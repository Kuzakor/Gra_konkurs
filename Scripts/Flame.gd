extends RigidBody2D
#Importuje główny skrypt
onready var global = get_node("/root/Global")

#Co klatke
func _physics_process(delta):
	if len(get_colliding_bodies()) > 0:
		#Gdy cialo koliduje z czyms, odejmuje 10 od zmiennej global.health lub 2 od global.shield gdy aktywna jest tarcza
		if global.shield <= 0:
			global.health -= 10
		else:
			#Gra dzwięk tarczy
			get_parent().get_child(0).play()
			global.shield -= 2
