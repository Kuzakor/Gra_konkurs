extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel = Vector2.ZERO
var jump_high = 0


onready var global = get_node("/root/Global")
onready var music = get_node("/root/Music")
onready var hp_befeore = global.health
onready var hp_after = global.health
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.volume_db = global.sound
	$Hurt.volume_db = global.sound
	 # Replace with function body.

func _physics_process(delta):
	if global.bounce:
		set_bounce(0.9)
	else:
		set_bounce(0)
	hp_after = global.health
	if hp_befeore != hp_after and $AnimationPlayer.current_animation != "Hit":
		$AnimationPlayer.play("Hit")
		$Hurt.play()
		hp_befeore = global.health
	var a = Vector2.ZERO
	# (0, 0) 
	if global.reverse:
		a.x = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	else:
		a.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if Input.is_action_just_pressed("ui_up") and len(get_colliding_bodies()) > 0:
		a.y = -1
		$AudioStreamPlayer.play()
	if a != Vector2.ZERO:
		vel = a
		if $AnimationPlayer.current_animation != "Hit":
			$AnimationPlayer.play("Run")
		self.physics_material_override.friction = 0.5 
	else:
		vel = Vector2.ZERO
		if $AnimationPlayer.current_animation != "Hit":
			if global.shield:
				$AnimationPlayer.play("Shield")
			else:
				$AnimationPlayer.play("Idle")
		if len(get_colliding_bodies()) > 0:
			self.physics_material_override.friction = 1000 
			
	if global.jump_boost:
		jump_high = 36000
	else:
		jump_high = 18000
	apply_impulse(Vector2.ZERO, Vector2(vel.x * delta * 800 , vel.y *delta*jump_high))
	# Replace with function body.

# Replace with function body.
