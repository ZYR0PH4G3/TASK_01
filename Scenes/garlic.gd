extends Node2D

# We change these to standard variables so they don't stall the loading phase
var player: CharacterBody2D = null
var player_area: Area2D = null

@onready var garlic_area = $Area2D
signal garlic_collected

func _ready() -> void:
	# Safely find the player in the scene tree once everything is loaded
	player = get_parent().get_node("Player")
	if player:
		player_area = player.get_node("Area2D")

func _process(_delta: float) -> void: 
	# Only run the collision check if the player was successfully found
	if player_area and player_area.overlaps_area(garlic_area): 
		if self.visible:
			emit_signal("garlic_collected") 
			self.hide()
