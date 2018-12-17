extends Node

func generate_combination(length):
	var combination = []
	for num in range(length):
		combination.append(randi() % 10)
	return combination