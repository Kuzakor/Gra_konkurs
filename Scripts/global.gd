extends Node
#Globalne zmienne
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
	#Jeżeli ilosc pieniedzy sie zmienila, ustawia glosnosc i odtwarza dziek zbierania pieniedzy. (Jeżeli 2 dzieckiem jest odtwarzac dzwieku)
	if current_money != money:
		if get_tree().get_current_scene().get_child(1) is AudioStreamPlayer:
			get_tree().get_current_scene().get_child(1).volume_db = sound
			get_tree().get_current_scene().get_child(1).play()

	# Po wciśnięciu esc przekierowuje do menu
	if Input.is_action_just_pressed("esc"):
			get_tree().change_scene("res://Scenes/menu.tscn")
		
	# restartuje gre do 1 poziomu	
	if Input.get_action_strength("r"):
		health = 300 + health_rise
		bounce = false
		shield = 0
		reverse = false
		jump_boost = false
		get_tree().change_scene("res://Scenes/Node2D.tscn")
		
	#ustawia bounce na false gdy no_jump jest prawdziwe
	if no_jump: 
		bounce = false
		

	#Uaktualnia wartośc pieniedzy
	current_money = money
