extends AnimatedSprite


func _ready():
	play()


func _on_Area2D_body_entered(body):
	Global.GameState.coin_up()
	$AnimationPlayer.play("die")
	$Pickup_SFX.play()
