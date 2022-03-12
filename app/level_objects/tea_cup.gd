extends Node2D


signal win


func _on_Area2D_body_entered(body):
  if body.is_in_group("player"):
    LevelManager.win()
