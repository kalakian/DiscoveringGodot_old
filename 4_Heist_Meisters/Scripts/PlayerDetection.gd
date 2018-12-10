extends "res://Scripts/Character.gd"

const FOV_TOLERANCE = deg2rad(18)
const RED = Color(1, .25, .25)
const WHITE = Color(1, 1, 1)

onready var Player = get_node("/root/Level1/Player") # make this level neutral

func _process(delta):
	if Player_is_in_FOV_TOLERANCE():
		$Torch.color = RED
	else:
		$Torch.color = WHITE


func Player_is_in_FOV_TOLERANCE():
	var NPC_facing_direction = Vector2(1, 0).rotated(global_rotation)
	var direction_to_Player = (Player.global_position - global_position).normalized()
	
	if abs(direction_to_Player.angle_to(NPC_facing_direction)) < FOV_TOLERANCE:
		return true
	return false
	