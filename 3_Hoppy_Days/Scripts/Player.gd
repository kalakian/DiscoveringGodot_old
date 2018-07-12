extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3600
const UP = Vector2(0, -1)
const JUMP_SPEED = 1750

var motion = Vector2()

func _physics_process(delta):
	update_motion(delta)


func _process(delta):
	update_animation()


func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)


func update_animation():
	$AnimatedSprite.update(motion)


func fall(delta):
	if is_on_floor() or is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta


func run():
	motion.x = 0
	
	if Input.is_action_pressed("right"):
		motion.x += SPEED
	if Input.is_action_pressed("left"):
		motion.x -= SPEED


func jump():
	if is_on_floor() and Input.is_action_pressed("jump"):
		motion.y = -JUMP_SPEED
