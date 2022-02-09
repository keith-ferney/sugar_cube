extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func process_level(command):
  if has_method(command):
    call(command)

func win():
  get_tree().call_group("gui","win")
  get_tree().change_scene("res://app/gui/winscene.tscn")

func death():
  get_tree().change_scene("res://app/gui/death.tscn")
