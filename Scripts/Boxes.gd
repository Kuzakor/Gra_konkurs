extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

onready var global = get_node("/root/Global")


func _on_1st_box_body_entered(body):
	if global.money >= 300:
		global.money -= 300
		global.health_rise += 150# Replace with function body.
		$"1st box".queue_free()


func _on_2nd_box_body_entered(body):
	if global.money >= 600:
		global.money -= 300
		global.no_jump = true
		$"2nd box".queue_free() # Replace with function body.


func _on_3rd_box_body_entered(body):
	if global.money >= 900:
		global.long_shield = true;
		$"3rd box".queue_free() # Replace with function body.
