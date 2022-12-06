extends Node2D

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time
var index_ajout_ennemi = 0

var ennemiMax = 50
var ennemiPresent = 0

func _ready():
	pass

func _process(delta):
	if ennemiPresent <= ennemiMax:
		if index_ajout_ennemi == 60 || index_ajout_ennemi == 120:
			var random = rng.randf_range(1, 5)
			if int(random) == 1:
				AddEnnemi1()
			elif int(random) == 2:
				AddEnnemi2()
			elif int(random) == 3:
				AddEnnemi4()
			else:
				AddEnnemi5()
			
		if index_ajout_ennemi == 200:
			AddEnnemi3();
			index_ajout_ennemi = 0
		index_ajout_ennemi = index_ajout_ennemi + 1
	else:
		print("tuer tuot les ennemis")
	
func SpawnJoueur():
	pass

func AddEnnemi1():
	var nouveau_ennemi1 = load("res://Scene/Ennemi1.tscn").instance()
	nouveau_ennemi1.position.x = $Map1/Spawn1.position.x
	nouveau_ennemi1.position.y = $Map1/Spawn1.position.y
	add_child(nouveau_ennemi1)
	ennemiPresent = ennemiPresent +1

func AddEnnemi3():
	var nouveau_ennemi3 = load("res://Scene/Ennemi3.tscn").instance()
	nouveau_ennemi3.position.x = $Map1/Spawn3.position.x
	nouveau_ennemi3.position.y = $Map1/Spawn3.position.y
	add_child(nouveau_ennemi3)
	ennemiPresent = ennemiPresent +1

func AddEnnemi2():
	var nouveau_ennemi1 = load("res://Scene/Ennemi1.tscn").instance()
	nouveau_ennemi1.position.x = $Map1/Spawn2.position.x
	nouveau_ennemi1.position.y = $Map1/Spawn2.position.y
	add_child(nouveau_ennemi1)
	ennemiPresent = ennemiPresent +1

func AddEnnemi4():
	var nouveau_ennemi1 = load("res://Scene/Ennemi1.tscn").instance()
	nouveau_ennemi1.position.x = $Map1/Spawn4.position.x
	nouveau_ennemi1.position.y = $Map1/Spawn4.position.y
	add_child(nouveau_ennemi1)
	ennemiPresent = ennemiPresent +1

func AddEnnemi5():
	var nouveau_ennemi1 = load("res://Scene/Ennemi2.tscn").instance()
	nouveau_ennemi1.position.x = $Map1/Spawn5.position.x
	nouveau_ennemi1.position.y = $Map1/Spawn5.position.y
	add_child(nouveau_ennemi1)
	ennemiPresent = ennemiPresent +1

