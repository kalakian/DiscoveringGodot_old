extends "res://Scripts/Character.gd"

var velocity = Vector2()

func _process(delta):
	update_facing()
	update_velocity()
	move_and_slide(velocity)


func update_facing():
	look_at(get_global_mouse_position())


func update_velocity():
	var direction = Vector2()
	
	direction.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	direction.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	
	if direction.length() != 0:
		velocity += direction.normalized() * SPEED
		velocity = velocity.clamped(MAX_SPEED)
	else:
		velocity = velocity.normalized() * lerp(velocity.length(), 0, FRICTION)
