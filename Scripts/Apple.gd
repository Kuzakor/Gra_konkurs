extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#	pass
onready var global = get_node("/root/Global")

func _on_Apple_body_entered(body):
	global.jump_boost = true
	queue_free() # Replace with function body.



