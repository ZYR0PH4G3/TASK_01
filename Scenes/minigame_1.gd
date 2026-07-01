extends Node2D

@onready var minigame_timer = $Minigametimer 

var garlic_collected = 0 
var timer_end = false 

func _ready() -> void:
	await minigame_timer.Timer(7.0) 
	timer_end = true

func _process(delta: float) -> void: 
	if garlic_collected == 3: 
		if Global.minigames_done > 3: 
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn") 
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn") 
	
	# This shield stops the timer from stealing your life if you won!
	if timer_end and garlic_collected < 3: 
		Global.minigames_done -= 1 
		Global.lives -= 1 
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn") 

func garlic_collect() -> void: 
	garlic_collected = garlic_collected + 1
	print("Garlic collected! Total: ", garlic_collected)
