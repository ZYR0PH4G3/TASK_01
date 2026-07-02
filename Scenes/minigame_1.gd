extends Node2D

@onready var minigame_timer = $Minigametimer 

var garlic_collected = 0 
var timer_end = false 

func _ready() -> void:
	await minigame_timer.Timer(7.0) 
	timer_end = true
	print("TIMER EXPIRED! Calculating final garlic score...")

func _process(delta: float) -> void: 
	
	if timer_end: 
		if garlic_collected >= 3:
			print("You won! Progressing to next stage...")
			
			Global.minigames_done += 1 
			
			if Global.minigames_done > 3: 
				get_tree().change_scene_to_file("res://scenes/done_screen.tscn") 
			else:
				get_tree().change_scene_to_file("res://scenes/level_scene.tscn") 
		else:
			print("You lost!")
			Global.minigames_done -= 1 
			Global.lives -= 1 
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn") 

func garlic_collect() -> void: 
	garlic_collected = garlic_collected + 1
	print("Garlic collected! Current Total: ", garlic_collected)
