extends TextureButton

func _on_pressed() -> void: 
	hide()

	if get_owner() and get_owner().has_method("register_click"):
		get_owner().register_click()
