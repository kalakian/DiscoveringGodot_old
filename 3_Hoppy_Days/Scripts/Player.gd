extends KinematicBody2D

const SPEED = 750

var motion = Vector2()

func _physics_process(delta):
	motion = Vector2()
	
	if Input.is_action_pressed("right"):
		motion.x += SPEED
	if Input.is_action_pressed("left"):
		motion.x -= SPEED
	move_and_slide(motion)
	
	if motion.x > 0:
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif motion.x < 0:
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("idle")
		$AnimatedSprite.flip_h = false
