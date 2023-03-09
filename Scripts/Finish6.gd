extends RigidBody2D

#Zmienia scene na następną (poziom)
func _physics_process(delta):
	if len(get_colliding_bodies()) > 1:
		get_tree().change_scene("res://Scenes/level7.tscn")
