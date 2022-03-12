extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

  if LevelManager.get_levels().pop_back().order == LevelManager.currentLevelNode.order:
    $next.hide()
  elif LevelManager.get_levels().pop_front().order == LevelManager.currentLevelNode.order:
    $previous.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass
