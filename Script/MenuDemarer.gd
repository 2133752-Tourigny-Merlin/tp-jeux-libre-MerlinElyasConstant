extends Control

func _ready():
	pass # Replace with function body.


func _on_Commencer_pressed():
	get_tree().change_scene("res://Scene/Main.tscn")


func _on_Quitter_pressed():
	get_tree().quit()
