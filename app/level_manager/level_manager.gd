extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var state_machine : String

func process_level(command):
	if has_method(command):
		call(command)

func win():
	yield(get_tree().create_timer(2),"timeout")
	print("woohooo")
	get_tree().call_group("gui","win")

func death():
	yield(get_tree().create_timer(1),"timeout")
	get_tree().paused == false
	get_tree().reload_current_scene()

func pause():
	print("hello")
	update_state("pause")
	if state_machine == "pause":
		get_tree().paused = true
		get_tree().call_group("gui","popup_menu",true)
	else:
		get_tree().call_group("gui","popup_menu",false)
		get_tree().paused = false
		

func update_state(new_state):
	if state_machine == "win" && new_state == "pause":
		return
	if state_machine == "pause" && new_state == "pause":
		state_machine = "running"
	else:
		state_machine = "pause"
	
