extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body
	
func _physics_process(delta):
	if $AnimationPlayer.get_current_animation_position() >= 0.3:
		if $AnimationPlayer.get_current_animation_position() < 0.32:
			add_child(KinematicBody2D.new(), true)
			$KinematicBody2D.add_child(Sprite.new(), true)
			$KinematicBody2D.get_child(0).set_texture(preload("res://Free/Enemies/Plant/Bullet.png"))
			$KinematicBody2D.get_child(0).position.x = 583
			$KinematicBody2D.get_child(0).position.y = 453
			$KinematicBody2D.set_script(load("res://Scripts/Bullet.gd"))
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
