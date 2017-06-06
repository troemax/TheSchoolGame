extends Node

onready var box = get_node("Box")
onready var label_vel_x = get_node("label_vel_x")
onready var label_vel_y = get_node("label_vel_y")
var _udp = PacketPeerUDP.new()
var time_last = 0
var time_now = 0

func _ready():
	_udp.set_send_address("192.168.1.7", 25566)
	time_last = OS.get_unix_time()
	#set_process(true)

func _process(delta):
	time_now = OS.get_unix_time()
	if time_now - time_last > 1.5:
		time_last = time_now
		var pos = box.get_pos()
		var rot = box.get_rot()
		var ang_vel = box.get_angular_velocity()
		var lin_vel = Vector2()
		randomize()
		lin_vel.x = rand_range(-1000, 1000)
		randomize()
		lin_vel.y = rand_range(0, -1000)
		box.set_linear_velocity(lin_vel)
		_udp.put_var(str(pos.x)+"#"+str(pos.y)+"#"+str(rot)+"#"+str(lin_vel.x)+"#"+str(lin_vel.y)+"#"+str(ang_vel))
		label_vel_x.set_text("last lin_vel.x:"+str(lin_vel.x))
		label_vel_y.set_text("last lin_vel.y:"+str(lin_vel.y))
