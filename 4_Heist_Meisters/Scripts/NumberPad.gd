extends Popup

var combination = [4, 1, 5]
var guess = []

onready var display = $VSplitContainer/DisplayContainer/Display
onready var light = $VSplitContainer/ButtonContainer/ButtonGrid/Light

func _ready():
	connect_buttons()


func connect_buttons():
	for button in $VSplitContainer/ButtonContainer/ButtonGrid.get_children():
		if button is Button:
			button.connect("pressed", self, "_on_Button_pressed", [button.text])


func _on_NumberPad_about_to_show():
	reset_lock()


func _on_Button_pressed(text):
	if $UnlockTimer.is_stopped():
		if text == "OK":
			check_guess()
		else:
			enter(int(text))


func check_guess():
	if guess == combination:
		light = load(Global.GREEN_LIGHT)
		$UnlockTimer.start()
	else:
		reset_lock()


func enter(num):
	guess.append(num)
	update_display()


func reset_lock():
	light = load(Global.RED_LIGHT)
	guess.clear()
	display.clear()


func update_display():
	display.bbcode_text = "[center]" + PoolStringArray(guess).join("") + "[/center]"


func _on_UnlockTimer_timeout():
	hide()
