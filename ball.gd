extends RigidBody2D

onready var counter_1 = utils.get_main_node().get_node("counter_1")
onready var counter_2 = utils.get_main_node().get_node("counter_2")
onready var timer     = get_node("Timer")
var width             = Globals.get("display/width")
var height            = Globals.get("display/height")
var direction         = -1 #-1 = left; 1 = right

func _ready():
	timer.connect("timeout", self, "start_ball")
	set_fixed_process(true)

func _fixed_process(delta):
	var x = get_pos().x
	if x < 0:
		counter_2.add_points(10)
		direction = 1
		reset()
	elif x > width:
		counter_1.add_points(10)
		direction = -1
		reset()
	elif get_colliding_bodies().size() > 0:
		var collider = get_colliding_bodies()[0] #gets first (normally only) colliding body
		if collider.get_name() == "border 1" || collider.get_name() == "border 2":
			increase_speed()

func reset():
	set_linear_velocity(Vector2(0,0))
	set_pos(Vector2(width/2,height/2))
	timer.set_wait_time(1)
	timer.start()

func start_ball():
	randomize()
	var multiple = 1 #random either up or down
	if rand_range(0,1) > 0.5:
		multiple = -1
	set_linear_velocity(Vector2(direction*250,multiple*250))
	timer.stop()

func increase_speed():
	var velocity = get_linear_velocity()
	set_linear_velocity(velocity*1.03)