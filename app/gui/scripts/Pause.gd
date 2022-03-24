extends Node



func _process(delta):
  if Input.is_action_just_pressed("ui_cancel"):
    pause()

func pause():
  var paused = get_tree().paused
  if paused:
    get_tree().paused = false # fix
  else:
    $"/root/LevelManager".pause()
  print('ello world')
