extends Node2D

var player: CharacterBody2D = null
var player_area: Area2D = null

@onready var garlic_area = $Area2D

func _ready() -> void:
	player = get_parent().get_node_or_null("Player")
	if player:
		player_area = player.get_node_or_null("Area2D")

func _process(_delta: float) -> void: 
	if player_area and player_area.overlaps_area(garlic_area): 
		if self.visible:
			print("SUCCESS: Player touched garlic: ", self.name)
			
			# Check if the parent actually holds your level manager script
			if get_parent().has_method("garlic_collect"):
				get_parent().garlic_collect()
				print("SUCCESS: Score sent to main script!")
			else:
				print("ERROR: Garlic parent is '", get_parent().name, "' and lacks garlic_collect()!")
			
			self.hide()
