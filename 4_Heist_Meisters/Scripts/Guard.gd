extends "res://Scripts/PlayerDetection.gd"

var velocity = Vector2()
var possible_destinations = []
var path = []
var destination = Vector2()

export var walk_slowdown = 0.5
export var nav_stop_threshold = 5

onready var navigation = Global.Navigation
onready var available_destinations = Global.Destinations

func _ready():
	possible_destinations = available_destinations.get_children()
	make_path()


func _process(delta):
	navigate()


func navigate():
	destination = path[0]
	var distance_to_destination = global_position.distance_to(destination)
	
	if distance_to_destination > nav_stop_threshold:
		move()
	else:
		update_path()


func move():
	look_at(destination)
	velocity = (destination - global_position).normalized() * (MAX_SPEED * walk_slowdown)
	move_and_slide(velocity)


func make_path():
	randomize()
	var next_destination = possible_destinations[randi() % possible_destinations.size()]
	
	path = navigation.get_simple_path(global_position, next_destination.global_position)


func update_path():
	if path.size() == 1:
		if $Timer.is_stopped():
			$Timer.start()
	else:
		path.remove(0)


func _on_Timer_timeout():
	make_path()
