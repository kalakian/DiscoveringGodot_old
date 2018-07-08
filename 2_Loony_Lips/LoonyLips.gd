extends Node2D

var intro_text = "Welcome to Loony Lips, a fun word game.\n\n"
var player_words = []
var prompts = ["a name", "a thing", "another thing", "a feeling"]
var story = "Once apon a time, %s ate a %s with %s and was %s."

func _ready():
	$Blackboard/TextBox.clear()
	$Blackboard/StoryText.text = intro_text
	prompt_player(false)

func _on_OKButton_pressed():
	var new_text = $Blackboard/TextBox.text
	_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.clear()
	check_player_word_length()

func prompt_player(clear = true):
	if clear:
		$Blackboard/StoryText.clear()
	$Blackboard/StoryText.text += "Can I have %s, please?" % prompts[player_words.size()]

func check_player_word_length():
	if player_words.size() == prompts.size():
		tell_story()
	else:
		prompt_player()

func tell_story():
	$Blackboard/StoryText.text = story % player_words
