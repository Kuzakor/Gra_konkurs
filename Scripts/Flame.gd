extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var global = get_node("/root/Global")
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if len(get_colliding_bodies()) > 0:
		if global.shield <= 0:
			global.health -= 10
		else:
			get_parent().get_child(0).play()
			global.shield -= 2
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
