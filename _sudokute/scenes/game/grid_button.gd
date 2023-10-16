extends TextureButton


# Called when the node enters the scene tree for the first time.
func update_number(number):
	get_node("Number").visible = true
	get_node("Number").frame = number-1
