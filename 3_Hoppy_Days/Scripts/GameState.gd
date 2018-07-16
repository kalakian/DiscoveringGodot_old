extends Node2D


func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")


func _on_Player_player_death():
	end_game()
