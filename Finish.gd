extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	print(len(get_colliding_bodies()))
	if len(get_colliding_bodies()) > 1:
		print("FINISH")
		get_tree().change_scene("res://Node22D.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func a(b):
	pass
