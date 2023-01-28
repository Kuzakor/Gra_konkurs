extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel = Vector2.ZERO



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	var a = Vector2.ZERO
	# (0, 0) 
	a.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if Input.is_action_just_pressed("ui_up") and len(get_colliding_bodies()) > 0:
		a.y = -1
	if a != Vector2.ZERO:
		vel = a
		$AnimationPlayer.play("Run")
		self.physics_material_override.friction = 0.5 
	else:
		vel = Vector2.ZERO
		$AnimationPlayer.play("Idle")
		if len(get_colliding_bodies()) > 0:
			self.physics_material_override.friction = 1000 
	apply_impulse(Vector2.ZERO, Vector2(vel.x * delta * 600 , vel.y *delta*18000))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



