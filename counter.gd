extends Node2D

onready var counter = get_node("counter")

func _ready():
	pass

func add_points(var add):
	var points = int(counter.get_text())
	counter.set_text(str(points+add))
