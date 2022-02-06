extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var charge = 0
var limit = 400
var limit_divisor = limit/2
var multiplier = 2
var rotation_dirs = ["left", "right"]
var rotation_dir = rotation_dirs[1]
onready var chargeSprite = $Charge
onready var pointer = $Pointer
var frame = 0
var frame_time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(delta):
	pointer.hide()
	chargeSprite.hide()
	if Input.is_action_just_pressed("charge"):
		if rotation_dir == rotation_dirs[1]:
			rotation_dir = rotation_dirs[0]
		else:
			rotation_dir = rotation_dirs[1] 
	if Input.is_action_pressed("charge"):
		self.apply_central_impulse(-self.linear_velocity * 0.1)
		pointer.show()
		chargeSprite.show()
		chargeSprite.rotate(.1)
		if charge < limit:
			charge = charge + multiplier 
		
		calc_frame(delta)

		if rotation_dir == "left":
			pointer.rotate(-0.05)
		else:
			pointer.rotate(0.05)
		
	elif Input.is_action_just_released("charge"):
		frame = 0
		self.apply_impulse(Vector2(0, 0), Vector2(0, -charge*2).rotated(pointer.get_global_rotation()))
		var tqe = 1000
		if rotation_dir == "left":
			tqe = -1000
		self.apply_torque_impulse(tqe)
		print_debug(charge)
		charge = 0
		
	chargeSprite.set_frame(frame)
	

func calc_frame(delta):
	frame_time = frame_time + delta
	if frame_time >= 0.1:
		frame_time = 0
		var frame_set = int(charge / limit_divisor)
		match frame_set:
			0:
				if frame == 0: frame = 1
				else: frame = 0
			1:
				if frame == 2: frame = 3
				else: frame = 2
			2:
				if frame == 4: frame = 5
				else: frame = 4
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


