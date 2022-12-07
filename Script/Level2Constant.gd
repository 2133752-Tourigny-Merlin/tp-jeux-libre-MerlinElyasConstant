extends Node2D

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time
var index_ajout_ennemi = 0

var ennemiMax = 50
var ennemiPresent = 0

func _ready():
	pass

func _process(delta):
	if ennemiPresent < ennemiMax:
		if index_ajout_ennemi == 60 || index_ajout_ennemi == 120 || index_ajout_ennemi == 1:
			var random = rng.randf_range(1, 3)
			if int(random) == 1:
				AddEnnemi1()
			elif int(random) == 2:
				AddEnnemi2()
			
		if index_ajout_ennemi == 180:
			index_ajout_ennemi = 0
		index_ajout_ennemi = index_ajout_ennemi + 1
	

func AddEnnemi1():
	var nouveau_ennemi = load("res://Scene/Ennemi2.tscn").instance()
	nouveau_ennemi.position.x = $Spawn1.position.x
	nouveau_ennemi.position.y = $Spawn1.position.y
	add_child(nouveau_ennemi)
	ennemiPresent = ennemiPresent +1

func AddEnnemi2():
	var nouveau_ennemi = load("res://Scene/Ennemi2.tscn").instance()
	nouveau_ennemi.position.x = $Spawn2.position.x
	nouveau_ennemi.position.y = $Spawn2.position.y
	add_child(nouveau_ennemi)
	ennemiPresent = ennemiPresent +1
