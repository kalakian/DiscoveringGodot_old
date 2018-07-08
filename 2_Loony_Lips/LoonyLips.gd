extends Node2D

var player_words = []
var current_story
var other_text

func _ready():
	randomize()
	other_text = get_from_json("other-strings.json")
	set_random_story()
	$Blackboard/StoryText.text = other_text.intro_text
	$Blackboard/TextBox.clear()
	prompt_player(false)


func set_random_story():
	var stories = get_from_json("stories.json")
	current_story = stories[randi() % stories.size()]


func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ) # assumes the file exists
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	
	return data


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
	return player_words.size() == current_story.prompt.size()


func prompt_player(clear = true):
	if clear:
		$Blackboard/StoryText.clear()
	$Blackboard/StoryText.text += other_text.prompt % current_story.prompt[player_words.size()]
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
	$Blackboard/OKButton/ButtonLabel.text = other_text.again
