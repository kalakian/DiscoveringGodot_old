extends Node

var Player
var Navigation
var Destinations


# Asset links
var nightvision_on_sfx = "res://SFX/nightvision.wav"
var nightvision_off_sfx = "res://SFX/nightvision_off.wav"

const RED_LIGHT = "res://GFX/Interface/PNG/dotRed.png"
const GREEN_LIGHT = "res://GFX/Interface/PNG/dotGreen.png"

const PLAYER_SPRITE = "res://GFX/PNG/Hitman 1/hitman1_stand.png"
const BOX_SPRITE = "res://GFX/PNG/Tiles/tile_129.png"

const PLAYER_OCCLUDER = "res://Scenes/Characters/CharacterOccluder.tres"
const BOX_OCCLUDER = "res://Scenes/Characters/BoxOccluder.tres"

const PLAYER_COLLIDER = "res://Scenes/Characters/CharacterCollider.tres"
const BOX_COLLIDER = "res://Scenes/Characters/BoxCollider.tres"

const BOX_ICON = "res://GFX/PNG/Tiles/tile_156.png"

const BRIEFCASE_ICON = "res://GFX/Loot/suitcase.png"

func _ready():
	randomize()
