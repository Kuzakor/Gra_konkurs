extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var music = get_node("/root/Music")
onready var global = get_node("/root/Global")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Sound_high_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		global.sound -= 5 # Replace with function body.
		$AudioStreamPlayer.volume_db = global.sound
		$AudioStreamPlayer.play()
