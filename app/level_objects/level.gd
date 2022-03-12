extends Node2D

export(String, 'easy', 'normal', 'hard') var difficulty = 'easy'
export var order: int = 0

func _ready():
  LevelManager.currentLevel = self.order
  LevelManager.currentLevelNode = self
  
func _exit_tree():
  get_tree().paused = false
