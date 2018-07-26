extends CanvasLayer


func _ready():
	Global.GUI = self


func update_GUI(coins, lives):
	$Banner/HBoxContainer/VBoxContainer/HBoxContainer/CoinCount.text = "%02d" % coins
	$Banner/HBoxContainer/VBoxContainer/HBoxContainer/LifeCount.text = "%02d" % lives


func coin_up():
	$AnimationPlayer.play("CoinPulse")


func hurt():
	$AnimationPlayer.play("Hurt")


func life_up():
	$AnimationPlayer.play("LifePulse")
