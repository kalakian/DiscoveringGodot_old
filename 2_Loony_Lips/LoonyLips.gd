extends Node2D

var intro_text = "Welcome to Loony Lips, a fun word game.\n\n"
var player_words = []
var template = [
		{
		"prompts" : ["a name", "a thing", "another thing", "a feeling"],
		"story" : "Once apon a time, %s ate a %s with %s and was %s."
		},
		{
		"prompts" : ["a place", "a thing", "a compass direction"],
		"story" : "You awake in %s, there is %s here. There is an exit to the %s"
		}
		]
var current_story

func _ready():
	randomize()
	current_story = template[randi() % template.size()]
	$Blackboard/TextBox.clear()
	$Blackboard/StoryText.text = intro_text
	prompt_player(false)

func _on_OKButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/TextBox.text
		_on_TextBox_text_entered(new_text)

func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.clear()
	check_player_word_length()

func is_story_done():
	return player_words.size() == current_story.prompts.size()

func prompt_player(clear = true):
	if clear:
		$Blackboard/StoryText.clear()
	$Blackboard/StoryText.text += "Can I have %s, please?" % current_story.prompts[player_words.size()]
	$Blackboard/TextBox.grab_focus()

func check_player_word_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()

func tell_story():
	$Blackboard/StoryText.text = current_story.story % player_words
	end_game()

func end_game():
	$Blackboard/TextBox.queue_free()
	$Blackboard/OKButton/ButtonLabel.text = "Again!"
