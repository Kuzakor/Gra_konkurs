extends Node2D


#Importuje główny skrypt i scene muzyki
onready var global = get_node("/root/Global")
onready var music = get_node("/root/Music")

func _on_Sound_high_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		global.sound += 5
		$AudioStreamPlayer.volume_db = global.sound
		$AudioStreamPlayer.play()


func _on_Sound_low_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		global.sound -= 5 
		$AudioStreamPlayer.volume_db = global.sound
		$AudioStreamPlayer.play()



func _on_Music_high_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		music.get_node("AudioStreamPlayer").volume_db += 5  


func _on_Leave_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		get_tree().change_scene("res://Scenes/menu.tscn")  


func _on_Music_low_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		music.get_node("AudioStreamPlayer").volume_db -= 5  
