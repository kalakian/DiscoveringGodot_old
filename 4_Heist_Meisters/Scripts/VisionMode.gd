extends CanvasModulate

const DARK = Color("0a0b39")
const NIGHTVISION = Color("267824")

func _ready():
	add_to_group("interface")
	color = DARK


func NightVision_mode():
	color = NIGHTVISION
	play_sfx(Global.nightvision_on_sfx)


func DarkVision_mode():
	color = DARK
	play_sfx(Global.nightvision_off_sfx)


func play_sfx(sfx):
	$AudioStreamPlayer.stream = load(sfx)
	$AudioStreamPlayer.play()