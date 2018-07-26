extends CanvasLayer


func _ready():
	Global.GUI = self


func update_GUI(lives):
	$Banner/HBoxContainer/VBoxContainer/HBoxContainer/LifeCount.text = "%02d" % lives
