extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var charge = 0
var limit = 120
var multiplier = 2
var rotation_dirs = ["left", "right"]
var rotation_dir = rotation_dirs[1]
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_down"):
		if rotation_dir == rotation_dirs[1]:
			rotation_dir = rotation_dirs[0]
		else:
			rotation_dir = rotation_dirs[1] 
	if Input.is_action_pressed("ui_down") and charge < limit:
		charge = charge + multiplier
	elif Input.is_action_just_released("ui_down"):
		
		self.apply_impulse(Vector2(0, 0), Vector2(charge, -charge))
		self.apply_torque_impulse(charge*50)
		print_debug(charge)
		charge = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
