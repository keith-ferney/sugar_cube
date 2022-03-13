extends RigidBody2D

var limit = 300
var torque = 1000
var multiplier = 1
var base_charge = limit/4
var charge = base_charge
var rotation_speed = 0.05
var score = 0
onready var rotation_nullifier = $rotation_nullifier
onready var pointer = $rotation_nullifier/Pointer
onready var chargeSprite = $rotation_nullifier/Charge
onready var animationPlayer = $AnimationPlayer

func _ready():

  hide_movement_indicators()

func _physics_process(_delta):
#  rotation = 0
  if Input.is_action_just_pressed("charge"):
    rotation_speed = -rotation_speed
  if Input.is_action_pressed("charge"):
    show_movement_indicators()
    pointer.rotate(rotation_speed)
    chargeSprite.rotate(-rotation_speed*2)
    rotation_nullifier.global_rotation = 0
    self.apply_central_impulse(-self.linear_velocity * 0.1)
    match int(floor(charge / base_charge)):
      1: animationPlayer.play("Stage 1")
      2: animationPlayer.play("Stage 2")
      3: animationPlayer.play("Stage 3")
    if charge < limit:
      charge = charge + multiplier 

  elif Input.is_action_just_released("charge"):
    hide_movement_indicators()
    score +=1
    self.apply_impulse(Vector2(0, 0), Vector2(0, -charge*2).rotated(pointer.get_global_rotation()))
    torque = -torque
    self.apply_torque_impulse(torque)
    charge = base_charge

func show_movement_indicators():
  pointer.show()
  chargeSprite.show()

func hide_movement_indicators():
  pointer.hide()
  chargeSprite.hide()
  
    
