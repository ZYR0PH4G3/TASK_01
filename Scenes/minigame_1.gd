extends Node2D

var garlic_collected = 0 
var timer_end = false 

func _ready() -> void:
	# This creates the 5-second countdown safely in the code
	await get_tree().create_timer(5.0).timeout
	timer_end = true
	print("TIMER EXPIRED! Attempting scene change...")

func _process(delta: float) -> void: 
	
	if garlic_collected == 3: 
		if Global.minigames_done > 3: 
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn") 
		else:
			# Fixed to match your actual file name!
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn") 
	
	if timer_end: 
		Global.minigames_done -= 1 
		Global.lives -= 1 
		# Fixed to match your actual file name!
		get_tree().change_scene_to_file("res://scenes/level_scene.tscn") 

func garlic_collect() -> void: 
	garlic_collected = garlic_collected + 1
	print("Garlic collected! Total: ", garlic_collected)
