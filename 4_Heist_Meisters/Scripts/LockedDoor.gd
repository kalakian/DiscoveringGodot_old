extends "res://Scripts/Door.gd"

var combination
var locked = true

func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		if locked:
			$CanvasLayer/NumberPad.popup_centered()
		else:
			open()


func _on_Door_body_exited(body):
	if body == Global.Player:
		can_click = false
		$CanvasLayer/NumberPad.hide()


func _on_NumberPad_combination_correct():
	locked = false
	open()


func _on_Computer_set_combination(combination):
	self.combination = combination
	$CanvasLayer/NumberPad.combination = combination
