extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var health = 300
var sound = 1
var bounce = false
var reverse = false	 
var shield = 0
var jump_boost = false
var money = 0
var pause
var is_pause = false
var current_money

func _process(delta):
	
	if current_money != money:
		if get_tree().get_current_scene().get_child(1) is AudioStreamPlayer:
			get_tree().get_current_scene().get_child(1).play()
			print("dzyn")
			
	if Input.is_action_just_pressed("esc"):
		if not is_pause:
			pause = get_tree().get_current_scene()
			get_tree().change_scene("res://Scenes/menu.tscn")
			is_pause = true
		else:
			get_tree().change_scene_to(pause)
			is_pause = false
			
	if Input.get_action_strength("r"):
		health = 300
		bounce = false
		shield = 0
		reverse = false
		money = 0
		jump_boost = false
		

		get_tree().change_scene("res://Scenes/Node2D.tscn")
	current_money = money
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
