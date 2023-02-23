extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
onready var global = get_node("/root/Global")
func _process(delta):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		global.health = 300 + global.health_rise
		global.bounce = false
		global.shield = 0
		global.reverse = false
		global.jump_boost = false
		get_tree().change_scene("res://Scenes/Shop.tscn")
		
		

