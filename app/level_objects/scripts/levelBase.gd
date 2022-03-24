extends Node2D

export(String, 'easy', 'normal', 'hard') var difficulty = 'easy'
export var order: int = 1
export var par: int = 5

func _ready():
  LevelManager.currentLevel = self.order
  LevelManager.currentLevelNode = self
  
func _exit_tree():
  get_tree().paused = false
