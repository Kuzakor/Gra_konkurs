extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var global = get_node("/root/Global")
func _ready():
	$AudioStreamPlayer.volume_db = global.sound
# Called when the node enters the scene tree for the first time.
	 # Replace with function body.
func _process(delta):
	$AnimatedSprite.set_frame(6 - global.health/50)
	$AudioStreamPlayer.play()
	if global.health < 0:
		get_tree().change_scene("res://Scenes/You dead screen.tscn")

			
			
		
#
#
#	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
