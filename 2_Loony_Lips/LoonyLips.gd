extends Node2D

func _ready():
	var prompt = ["Derek", "cheeseburger", "wedges", "happy"]
	var story = "Once apon a time, %s ate a %s with %s and was %s."
	$Blackboard/StoryText.text = story % prompt
	$Blackboard/TextBox.clear()

func _on_OKButton_pressed():
	var new_text = $Blackboard/TextBox.text
	_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	$Blackboard/StoryText.text = new_text
	$Blackboard/TextBox.clear()
