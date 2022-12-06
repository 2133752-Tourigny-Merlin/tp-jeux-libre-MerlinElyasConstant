extends Node2D

# Called when the node enters the scene tree for the first time.
onready var _ennemi1 = $Ennemi1
var index_ajout_ennemi = 0

func _ready():
	pass

func _process(delta):
	print(index_ajout_ennemi)
	if index_ajout_ennemi ==100:
		AddEnnemi();
		index_ajout_ennemi = 0
	index_ajout_ennemi = index_ajout_ennemi + 1
func SpawnJoueur():
	pass

func AddEnnemi():
	var nouveau_ennemi1 = load("res://Scene/Ennemi1.tscn").instance()
	nouveau_ennemi1.position.x = $Spawn1.position.x
	nouveau_ennemi1.position.y = $Spawn1.position.y
	add_child(nouveau_ennemi1)

func DeleteEnnemi():
	pass
