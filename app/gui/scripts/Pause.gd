extends Node



func _physics_process(delta):
  if Input.is_action_just_pressed("ui_cancel"):
    pause()

func pause():
  
  if get_tree().paused:
    get_tree().paused = false # fix
  else:
    $"/root/LevelManager".pause()
  print('ello world')
