extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var global = get_node("/root/Global")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pineapple_body_entered(body):
	global.health = 300 + global.health_rise
	global.reverse = true
	queue_free() # Replace with function body.
