extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func process_level(command):
	if has_method(command):
		call(command)

func win():
	yield(get_tree().create_timer(2),"timeout")
	print("woohooo")
	get_tree().call_group("gui","win")

func death():
	yield(get_tree().create_timer(2),"timeout")
	get_tree().reload_current_scene()
