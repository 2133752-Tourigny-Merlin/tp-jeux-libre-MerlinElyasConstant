extends Node2D

var ennemiTuer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if ennemiTuer == 50:
		print(get_node("Level1"))
		get_node("Level1").queue_free()
		$Joueur.position.x = 0
		$Joueur.position.y = 0
		$Joueur/Camera2D/Control/CompteARebours.secondes = 30
		$Joueur/Camera2D/Control/CompteARebours.minutes = 3
		add_child(load("res://Scene/Level2Constant.tscn").instance())
		ennemiTuer = ennemiTuer +1
	print(ennemiTuer)
		#print(ennemiTuerTotal)
