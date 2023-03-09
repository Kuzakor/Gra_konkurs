extends Node2D


#Importuje główny skrypt i scene muzyki
onready var global = get_node("/root/Global")
onready var music = get_node("/root/Music")


#Zwiększa głośność po naciśnięciu
func _on_Sound_high_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		global.sound += 5
		$AudioStreamPlayer.volume_db = global.sound
		$AudioStreamPlayer.play()

#Zmniejsza głośność po naciśnięciu
func _on_Sound_low_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		global.sound -= 5 
		$AudioStreamPlayer.volume_db = global.sound
		$AudioStreamPlayer.play()


#Zwiększa głośność muzyki po naciśnięciu
func _on_Music_high_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		music.get_node("AudioStreamPlayer").volume_db += 5  

#Wraca do menu po naciśnięciu
func _on_Leave_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		get_tree().change_scene("res://Scenes/menu.tscn")  

#Zmienjsza głośność muzyki po naciśnięciu
func _on_Music_low_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		music.get_node("AudioStreamPlayer").volume_db -= 5  
