extends Node2D

export var starting_lives = 3
var lives


func _ready():
	Global.GameState = self
	lives = starting_lives


func hurt():
	Global.Player.hurt()
	lives -= 1
	if lives < 0:
		end_game()


func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
