extends Area2D

#Po naciśnieciu guzika myszką zmienia scene na ustawienia
func _on_Area2D2_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		get_tree().change_scene("res://Scenes/Settings.tscn")
