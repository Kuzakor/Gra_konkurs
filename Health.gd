extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var global = get_node("/root/Global")
# Called when the node enters the scene tree for the first time.
	 # Replace with function body.
func _process(delta):
	print(global.health)
	match global.health:
		300:
			$AnimatedSprite.set_frame(0)
		250:
			$AnimatedSprite.set_frame(1)
		200:
			$AnimatedSprite.set_frame(2)
		150:
			$AnimatedSprite.set_frame(3)
		100:
			$AnimatedSprite.set_frame(4)
		50:
			$AnimatedSprite.set_frame(5)
		0:
			get_tree().change_scene("res://You dead screen.tscn")
#
#
#	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
