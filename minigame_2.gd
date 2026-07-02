extends Node2D

@onready var minigame_timer: Node2D = $Minigametimer

var buttons_pressed := 0

func _ready() -> void:
	await minigame_timer.Timer(5.0)
	
	check_game_results()

func register_click() -> void:
	buttons_pressed += 1
	print("Click registered! Total clicks: ", buttons_pressed)

func check_game_results() -> void:
	
	if buttons_pressed >= 5:
		print("You won the button game!")
		Global.minigames_done += 1
		
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	
	
	else:
		print("You lost the button game!")
		Global.lives -= 1
		
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
