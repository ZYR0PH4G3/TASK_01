extends Node2D

@onready var minigame_timer = $Minigametimer 

var garlic_collected = 0 
var timer_end = false 

func _ready() -> void:
	# Starts your 7-second visual countdown
	await minigame_timer.Timer(7.0) 
	timer_end = true
	print("TIMER EXPIRED! Calculating final garlic score...")

func _process(delta: float) -> void: 
	
	# The game ONLY transitions when the 7-second timer runs completely out:
	if timer_end: 
		# WIN STATE: Player successfully got 3 or more garlic
		if garlic_collected >= 3:
			print("You won! Progressing to next stage...")
			
			# Tells the Global script that you beat a minigame!
			Global.minigames_done += 1 
			
			# If they beat more than 3 minigames in total, go to the final win screen
			if Global.minigames_done > 3: 
				get_tree().change_scene_to_file("res://scenes/done_screen.tscn") 
			else:
				# Otherwise, go back to the intermission to load minigame 2!
				get_tree().change_scene_to_file("res://scenes/level_scene.tscn") 
		
		# LOSE STATE: Player failed to get enough garlic
		else:
			print("You lost!")
			Global.minigames_done -= 1 
			Global.lives -= 1 
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn") 

func garlic_collect() -> void: 
	garlic_collected = garlic_collected + 1
	print("Garlic collected! Current Total: ", garlic_collected)
