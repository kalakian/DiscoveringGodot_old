extends "res://Scripts/Character.gd"

export var disguises = 3 # how many disguises you start with
export var disguise_duration = 5 # how long a disguise can last
export var disguise_slowdown = 0.25

var velocity = Vector2()
enum VISION_MODES {DARK, NIGHTVISION}
var vision_mode = VISION_MODES.DARK
var disguised = false
var velocity_multipler = 1

const PLAYER_LAYER = 1
const BOX_LAYER = 16

func _ready():
	Global.Player = self
	$DisguiseTimer.wait_time = disguise_duration
	get_tree().call_group("DisguiseDisplay", "update_disguises", disguises)
	reveal()


func _process(delta):
	update_facing()
	update_velocity()
	move_and_slide(velocity * velocity_multipler)
	update_label()


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


func update_label():
	if disguised:
		$Label.rect_rotation = -rotation_degrees
		$Label.text = str($DisguiseTimer.time_left).pad_decimals(2)


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
	elif disguises > 0:
		disguise()


func reveal():
	$Label.visible = false
	$Sprite.texture = load(Global.PLAYER_SPRITE)
	$Light2D.texture = load(Global.PLAYER_SPRITE)
	$LightOccluder2D.occluder = load(Global.PLAYER_OCCLUDER)
	$CollisionShape2D.shape = load(Global.PLAYER_COLLIDER)
	collision_layer = PLAYER_LAYER
	velocity_multipler = 1
	
	disguised = false


func disguise():
	$Label.visible = true
	$Sprite.texture = load(Global.BOX_SPRITE)
	$Light2D.texture = load(Global.BOX_SPRITE)
	$LightOccluder2D.occluder = load(Global.BOX_OCCLUDER)
	$CollisionShape2D.shape = load(Global.BOX_COLLIDER)
	collision_layer = BOX_LAYER
	velocity_multipler = disguise_slowdown
	$DisguiseTimer.start()
	
	disguises -= 1
	get_tree().call_group("DisguiseDisplay", "update_disguises", disguises)
	disguised = true
