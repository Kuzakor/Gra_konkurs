extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	add_central_force(Vector2(-5,0))
	if len(get_colliding_bodies()) > 1:
		queue_free()
	 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
