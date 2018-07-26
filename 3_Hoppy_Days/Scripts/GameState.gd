extends Node2D

export var starting_lives = 3
export var coin_target = 20 # How many coins for an extra life

var lives
var coins = 0

onready var GUI = Global.GUI

func _ready():
	Global.GameState = self
	lives = starting_lives
	update_GUI()


func update_GUI():
	GUI.update_GUI(coins, lives)


func hurt():
	Global.Player.hurt()
	GUI.hurt()
	lives -= 1
	update_GUI()
	if lives < 0:
		end_game()


func coin_up():
	coins += 1
	GUI.coin_up()
	if coins == coin_target:
		coins = 0
		life_up()
	update_GUI()


func life_up():
	GUI.life_up()
	lives += 1


func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
