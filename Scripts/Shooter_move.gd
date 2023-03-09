extends RigidBody2D

var which_child = 3
var active = false
	
	
#To samo co Shooter.gd ale aktywuje się dopiero po kolizji z 2 obiektami na raz.
func _physics_process(delta):

	if len(get_colliding_bodies()) > 1:
		active = true
	if active:
		if $AnimationPlayer.get_current_animation_position() >= 0.3:
			if $AnimationPlayer.get_current_animation_position() < 0.32:
				add_child(RigidBody2D.new(), true)
				var bullet = get_child(which_child)
				bullet.add_child(Sprite.new(), true)
				bullet.get_child(0).set_texture(preload("res://Free/Enemies/Plant/Bullet.png"))
				bullet.get_child(0).position.x = $"Attack(44X42)".position.x - 30
				bullet.get_child(0).position.y = $"Attack(44X42)".position.y - 6
				bullet.add_child(CollisionShape2D.new(), true)
				bullet.get_child(1).set_shape(RectangleShape2D.new())
				bullet.get_child(1).position = bullet.get_child(0).position 
				bullet.set_contact_monitor(true)
				bullet.set_max_contacts_reported(10)
				bullet.set_bounce(5)
				get_child(which_child).set_script(load("res://Scripts/Bullet.gd"))
				
				which_child += 1
