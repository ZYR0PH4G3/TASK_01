
extends Node2D  # Changed to Node2D because your parent node is a Node2D!

# Grabs the player node from the parent scene
@onready var player: CharacterBody2D = $"../Player" 

# Grabs the collision area specifically attached to your player node
@onready var player_area = $"../Player/Area2D"

# Grabs the Area2D child node INSIDE this garlic node
@onready var garlic_area = $Area2D

# Signal broadcasted when garlic is picked up
signal garlic_collected

func _process(delta: float) -> void: 
	# We check if the player's area touches this garlic's child Area2D
	if player_area.overlaps_area(garlic_area): 
		if self.visible:
			emit_signal("garlic_collected") 
			self.hide()
