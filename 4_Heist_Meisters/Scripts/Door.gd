extends Area2D

var can_click = false


func _on_Door_body_entered(body):
	if body == Global.Player:
		can_click = true
	elif not $AnimationPlayer.is_playing():
		open()


func _on_Door_body_exited(body):
	if body == Global.Player:
		can_click = false


func open():
	$AnimationPlayer.play("open")


func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		open()
