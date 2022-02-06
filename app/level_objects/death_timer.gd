extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal death

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$Label.text = "time:" + str($Timer.time_left)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	get_node("/root/LevelManager").process_level("death")
	
	
