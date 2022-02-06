extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _process(delta):
	
	if Input.is_action_just_pressed("ui_pause"):
		get_node("/root/LevelManager").process_level("pause")

func popup_menu(popup):
	$Popup.visible = popup
	print("hello")
