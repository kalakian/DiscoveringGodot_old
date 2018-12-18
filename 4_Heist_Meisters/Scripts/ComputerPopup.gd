extends Popup

func set_text(combination):
	$RichTextLabel.bbcode_text = ("Will you stop forgetting your access code?\n\nI've set it to"
			+ "\n\n[center]" + PoolStringArray(combination).join("") + "[/center]\n\nbut this is the last time!")