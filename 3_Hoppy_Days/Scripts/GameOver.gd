extends Control


func _process(delta):
	if Input.is_action_just_pressed("ok"):
		try_again()


func _on_TextureButton_pressed():
	try_again()


func try_again():
	get_tree().change_scene(Global.Level1)

