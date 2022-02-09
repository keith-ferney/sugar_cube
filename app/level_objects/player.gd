extends RigidBody2D

var base_charge = 100
var charge = base_charge
var limit = 400
var limit_divisor = limit/2
var multiplier = 2
onready var chargeSprite = $Charge
onready var pointer = $Pointer
var frame = 0
var frame_time = 0
var torque = 1000
var rotation_speed = 0.05

func _ready():
  hide_movement_indicators()

func _physics_process(delta):
  if Input.is_action_just_pressed("charge"):
      rotation_speed = -rotation_speed
  if Input.is_action_pressed("charge"):
    show_movement_indicators()
    calc_animation_frame(delta)
    rotate_pointer()
    self.apply_central_impulse(-self.linear_velocity * 0.1)
    chargeSprite.rotate(.1)
    if charge < limit:
      charge = charge + multiplier 

  elif Input.is_action_just_released("charge"):
    hide_movement_indicators()

    frame = 0
    self.apply_impulse(Vector2(0, 0), Vector2(0, -charge*2).rotated(pointer.get_global_rotation()))
    torque = -torque
    self.apply_torque_impulse(torque)
    print_debug(charge)
    charge = base_charge
    
  chargeSprite.set_frame(frame)

func show_movement_indicators():
  pointer.show()
  chargeSprite.show()

func hide_movement_indicators():
  pointer.hide()
  chargeSprite.hide()
  
func rotate_pointer():
    pointer.rotate(rotation_speed)
    
func calc_animation_frame(delta):
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


