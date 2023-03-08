extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var health = 300
var health_rise = 0
var sound = 1
var bounce = false
var reverse = false	 
var shield = 0
var jump_boost = false
var money = 0
var no_jump = false
var long_shield = false
var current_money

func _process(delta):
	print(health)
	if current_money != money:
		if get_tree().get_current_scene().get_child(1) is AudioStreamPlayer:
			get_tree().get_current_scene().get_child(1).volume_db = sound
			get_tree().get_current_scene().get_child(1).play()
			print("dzyn")
			
	if Input.is_action_just_pressed("esc"):
			get_tree().change_scene("res://Scenes/menu.tscn")
			
	if Input.get_action_strength("r"):
		health = 300 + health_rise
		bounce = false
		shield = 0
		reverse = false
		jump_boost = false
		get_tree().change_scene("res://Scenes/Node2D.tscn")
	if no_jump: 
		bounce = false
		

		
	current_money = money
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
