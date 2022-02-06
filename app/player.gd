extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var charge = 0
var limit = 260
var limit_divisor = limit/5
var multiplier = 2
var rotation_dirs = ["left", "right"]
var rotation_dir = rotation_dirs[1]
onready var chargeSprite = $Charge
onready var pointer = $Pointer
var frame = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):

	if Input.is_action_just_pressed("ui_down"):
		if rotation_dir == rotation_dirs[1]:
			rotation_dir = rotation_dirs[0]
		else:
			rotation_dir = rotation_dirs[1] 
	if Input.is_action_pressed("ui_down"):
		if charge < limit:
			charge = charge + multiplier 
		chargeSprite.set_frame(int(charge / limit_divisor))
		pointer.rotate(0.1)
	elif Input.is_action_just_released("ui_down"):
		chargeSprite.set_frame(0)
		self.apply_impulse(Vector2(0, 0), Vector2(0, -charge*2).rotated(pointer.get_global_rotation()))
		var tqe = 1000
		if rotation_dir == "left":
			tqe = -1000
		self.apply_torque_impulse(tqe)
		print_debug(charge)
		charge = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
