extends AnimatedSprite

func update(motion):
	flip_h = false
	
	if motion.y < 0:
		play("jump")
	elif motion.x > 0:
		play("run")
	elif motion.x < 0:
		play("run")
		flip_h = true
	else:
		play("idle")
