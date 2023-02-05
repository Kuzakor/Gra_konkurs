extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var which_child = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body
	
func _physics_process(delta):
	if $AnimationPlayer.get_current_animation_position() >= 0.3:
		if $AnimationPlayer.get_current_animation_position() < 0.32:
			add_child(KinematicBody2D.new(), true)
			var bullet = get_child(which_child)
			bullet.add_child(Sprite.new(), true)
			bullet.get_child(0).set_texture(preload("res://Free/Enemies/Plant/Bullet.png"))
			bullet.get_child(0).position.x = $"Attack(44X42)".position.x - 10
			bullet.get_child(0).position.y = $"Attack(44X42)".position.y - 6
			bullet.add_child(CollisionShape2D.new(), true)
			bullet.get_child(1).set_shape(CircleShape2D.new())
			bullet.get_child(1).position = bullet.get_child(0).position 
			bullet.set_physics_process(true)
			get_child(which_child).set_script(load("res://Scripts/Bullet.gd"))
			
			which_child += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
