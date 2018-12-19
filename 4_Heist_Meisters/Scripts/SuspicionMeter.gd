extends TextureProgress

var suspicion = 0
export var suspicion_step = 1 # how much suspicion goes up every time we're seen
export var suspicion_dropoff = 0.25 # how much suspicion drops


func _process(delta):
	suspicion -= suspicion_dropoff
	suspicion = clamp(suspicion, min_value, max_value)
	value = suspicion


func player_seen():
	suspicion += suspicion_step
	if suspicion >= max_value:
		end_game()


func end_game():
	get_tree().quit()
