extends CanvasModulate

const DARK = Color("03081c")
const NIGHTVISION = Color("267824")

func _ready():
	add_to_group("interface")
	color = DARK
	get_tree().call_group("labels", "hide")


func NightVision_mode():
	color = NIGHTVISION
	play_sfx(Global.nightvision_on_sfx)
	inform_npcs("NightVision_mode")
	get_tree().call_group("labels", "show")


func DarkVision_mode():
	color = DARK
	play_sfx(Global.nightvision_off_sfx)
	inform_npcs("DarkVision_mode")
	get_tree().call_group("labels", "hide")


func play_sfx(sfx):
	$AudioStreamPlayer.stream = load(sfx)
	$AudioStreamPlayer.play()


func inform_npcs(vision_mode):
	get_tree().call_group("NPC", vision_mode)