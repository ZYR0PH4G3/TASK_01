extends Node2D

@onready var themed_timer: Node2D = $Minigametimer

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	# Starts your 7-second visual countdown
	await themed_timer.Timer(7.0)
	timer_end = true 

func _process(delta: float) -> void:
	
	# The game ONLY transitions when the 7-second timer runs completely out:
	if timer_end:
		# WIN STATE: Player successfully pressed all 4 buttons
		if buttons_pressed == 4:
			print("You won the button game!")
			
			# Tells the Global script that you beat a minigame!
			Global.minigames_done += 1
			
			if Global.minigames_done > 3:
				get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
			else:
				get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
		
		# LOSE STATE: Player failed to press all 4 buttons in time
		else:
			print("You lost the button game!")
			Global.lives -= 1
			Global.minigames_done -= 1
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
