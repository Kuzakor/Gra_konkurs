extends RigidBody2D


# Co klatke dodaje centralna sile o wektorze (-5,0)
func _physics_process(delta):
	add_central_force(Vector2(-5,0))

