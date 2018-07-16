extends Node2D


func _ready():
	Global.GameState = self.get_path()


func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")


func _on_Player_player_death():
	end_game()
