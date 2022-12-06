extends Node2D

var ennemiTuer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if ennemiTuer == 50:
		$Level1.queue_free()
		$Joueur.queue_free()
		add_child(load("res://Scene/Level2.tscn").instance())
		add_child(load("res://Scene/Joueur.tscn").instance())
		ennemiTuer = 0
	print(ennemiTuer)
		#print(ennemiTuerTotal)
