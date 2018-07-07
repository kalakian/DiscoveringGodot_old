extends Node2D

func _ready():
	var prompt = ["Derek", "cheeseburger", "wedges", "happy"]
	var story = "Once apon a time, %s ate a %s with %s and was %s."
	$Blackboard/StoryText.bbcode_text = story % prompt
