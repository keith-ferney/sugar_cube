extends Button


func _on_nav_button_pressed():
  get_tree().reload_current_scene()
