extends Node2D

#Importuje główny skrypt
onready var global = get_node("/root/Global")

#1 pudelko kosztuje 300 i ustawia globalna zmienna health_rise na 150 + obecna wartosc
func _on_1st_box_body_entered(body):
	if global.money >= 300:
		global.money -= 300
		global.health_rise += 150
		$"1st box".queue_free()

#2 pudelko kosztuje 600  i ustawia globalna zmienna no_jump na true
func _on_2nd_box_body_entered(body):
	if global.money >= 600:
		global.money -= 300
		global.no_jump = true
		$"2nd box".queue_free() 

#3 pudelko kosztuje 900  i ustawia globalna zmienna long_shield na true
func _on_3rd_box_body_entered(body):
	if global.money >= 900:
		global.long_shield = true;
		$"3rd box".queue_free() 
