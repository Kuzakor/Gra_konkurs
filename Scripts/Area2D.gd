extends Area2D

#Importuje główny skrypt	
onready var global = get_node("/root/Global")


#Po wejściu myszki w obszar i klinkięciu resetuje wszystkie wartości globalne oprócz tych stałych i zmienia scene na Shop.tscn
func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		global.health = 300 + global.health_rise
		global.bounce = false
		global.shield = 0
		global.reverse = false
		global.jump_boost = false
		get_tree().change_scene("res://Scenes/Shop.tscn")
		
		

