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
	match global.health:
		300:
			$AnimatedSprite.set_frame(0)
			$AudioStreamPlayer.play()
		250:
			$AnimatedSprite.set_frame(1)
			$AudioStreamPlayer.play()
		200:
			$AnimatedSprite.set_frame(2)
			$AudioStreamPlayer.play()
		150:
			$AnimatedSprite.set_frame(3)
			$AudioStreamPlayer.play()
		100:
			$AnimatedSprite.set_frame(4)
			$AudioStreamPlayer.play()
		50:
			$AnimatedSprite.set_frame(5)
			$AudioStreamPlayer.play()
		0:
			$AudioStreamPlayer.play()
			get_tree().change_scene("res://Scenes/You dead screen.tscn")
			
		
#
#
#	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
