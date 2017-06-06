extends Node

onready var ball     = get_node("ball")
onready var border_1 = get_node("border 1")
onready var border_2 = get_node("border 2")
var speed            = 380
var up_1             = false
var down_1           = false
var up_2             = false
var down_2           = false

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	ball.reset()

func _input(event):
	if event.is_action_pressed("up_1"):
		up_1 = true
	elif event.is_action_released("up_1"):
		up_1 = false
	if event.is_action_pressed("down_1"):
		down_1 = true
	elif event.is_action_released("down_1"):
		down_1 = false
	if event.is_action_pressed("up_2"):
		up_2 = true
	elif event.is_action_released("up_2"):
		up_2 = false
	if event.is_action_pressed("down_2"):
		down_2 = true
	elif event.is_action_released("down_2"):
		down_2 = false

func _fixed_process(delta):
	if up_1:
		border_1.set_pos(border_1.get_pos()+Vector2(0,-speed*delta))
	if down_1:
		border_1.set_pos(border_1.get_pos()+Vector2(0,speed*delta))
	if up_2:
		border_2.set_pos(border_2.get_pos()+Vector2(0,-speed*delta))
	if down_2:
		border_2.set_pos(border_2.get_pos()+Vector2(0,speed*delta))