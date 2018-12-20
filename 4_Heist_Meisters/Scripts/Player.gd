extends "res://Scripts/Character.gd"

var velocity = Vector2()
enum VISION_MODES {DARK, NIGHTVISION}
var vision_mode = VISION_MODES.DARK
var disguised = false

const PLAYER_LAYER = 1
const BOX_LAYER = 16

func _ready():
	Global.Player = self


func _process(delta):
	update_facing()
	update_velocity()
	move_and_slide(velocity)


func update_facing():
	look_at(get_global_mouse_position())


func update_velocity():
	var direction = Vector2()
	
	direction.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	direction.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	
	if direction.length() != 0:
		velocity += direction.normalized() * SPEED
		velocity = velocity.clamped(MAX_SPEED)
	else:
		velocity = velocity.normalized() * lerp(velocity.length(), 0, FRICTION)


func _input(event):
	if Input.is_action_just_pressed("vision_mode_change") and $VisionModeTimer.is_stopped():
		cycle_vision_mode()
		$VisionModeTimer.start()
	if Input.is_action_just_pressed("toggle_disguise"):
		toggle_disguise()


func cycle_vision_mode():
	if vision_mode == VISION_MODES.DARK:
		vision_mode = VISION_MODES.NIGHTVISION
		get_tree().call_group("interface", "NightVision_mode")
	elif vision_mode == VISION_MODES.NIGHTVISION:
		vision_mode = VISION_MODES.DARK
		get_tree().call_group("interface", "DarkVision_mode")


func toggle_disguise():
	if disguised:
		reveal()
	else:
		disguise()


func reveal():
	$Sprite.texture = load(Global.PLAYER_SPRITE)
	$Light2D.texture = load(Global.PLAYER_SPRITE)
	$LightOccluder2D.occluder = load(Global.PLAYER_OCCLUDER)
	$CollisionShape2D.shape = load(Global.PLAYER_COLLIDER)
	collision_layer = PLAYER_LAYER
	disguised = false


func disguise():
	$Sprite.texture = load(Global.BOX_SPRITE)
	$Light2D.texture = load(Global.BOX_SPRITE)
	$LightOccluder2D.occluder = load(Global.BOX_OCCLUDER)
	$CollisionShape2D.shape = load(Global.BOX_COLLIDER)
	collision_layer = BOX_LAYER
	disguised = true
