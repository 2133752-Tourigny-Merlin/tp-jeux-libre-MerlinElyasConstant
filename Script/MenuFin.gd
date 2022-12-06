extends Control

# Called when the node enters the scene tree for the first time.
func _on_ButtonRecommencer_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_ButtonQuitter_pressed():
	get_tree().quit()
