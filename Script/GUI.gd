extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	score = get_parent().get_parent().get_parent().ennemiTuer
	if get_parent().get_parent().get_parent().get_node_or_null("Level1"):
		$VBoxContainer/Score/LabelScore.text = str(score) + " /50"
	else:
		$VBoxContainer/Score/LabelScore.text = str(score) + " /100"

