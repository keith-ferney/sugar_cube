extends Button


export var scene : PackedScene


func _on_nav_button_pressed():
	get_tree().change_scene_to(scene)
