extends Popup

var combination = []
var guess = []

onready var display = $VSplitContainer/DisplayContainer/Display
onready var light = $VSplitContainer/ButtonContainer/ButtonGrid/Light

const MAX_DIGITS = 8
const BUTTON_SFX = "res://SFX/twoTone1.ogg"
const CORRECT_SFX = "res://SFX/threeTone1.ogg"

signal combination_correct

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
		$AudioStreamPlayer.stream = load(BUTTON_SFX)
		$AudioStreamPlayer.play()
		if text == "OK":
			check_guess()
		else:
			enter(int(text))


func check_guess():
	if guess == combination:
		light.texture = load(Global.GREEN_LIGHT)
		$AudioStreamPlayer.stream = load(CORRECT_SFX)
		$AudioStreamPlayer.play()
		$UnlockTimer.start()
	else:
		reset_lock()


func enter(num):
	if guess.size() < MAX_DIGITS:
		guess.append(num)
		update_display()


func reset_lock():
	light.texture = load(Global.RED_LIGHT)
	guess.clear()
	display.clear()


func update_display():
	display.bbcode_text = "[center]" + PoolStringArray(guess).join("") + "[/center]"


func _on_UnlockTimer_timeout():
	emit_signal("combination_correct")
	hide()
