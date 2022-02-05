extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func process_level(command):
	if has_method(command):
		call(command)

func win():
	yield(get_tree().create_timer(0.5),"timeout")
	print("woohooo")

func death():
	print("U DIEDED dumdum")
