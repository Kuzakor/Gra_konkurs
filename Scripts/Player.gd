extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel = Vector2.ZERO


onready var global = get_node("/root/Global")
onready var hp_befeore = global.health
onready var hp_after = global.health
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.volume_db = global.sound # Replace with function body.

func _physics_process(delta):
	hp_after = global.health
	if hp_befeore != hp_after and $AnimationPlayer.current_animation != "Hit":
		$AnimationPlayer.play("Hit")
		hp_befeore = global.health
	var a = Vector2.ZERO
	# (0, 0) 
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
			$AnimationPlayer.play("Idle")
		if len(get_colliding_bodies()) > 0:
			self.physics_material_override.friction = 1000 
	apply_impulse(Vector2.ZERO, Vector2(vel.x * delta * 800 , vel.y *delta*18000))
	# Replace with function body.
