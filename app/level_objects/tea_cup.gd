extends Node2D


signal win


func _on_Area2D_body_entered(body):
  if body.is_in_group("player"):
    get_node("/root/LevelManager").process_level("win")
