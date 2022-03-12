extends Control



const navButton = preload("res://app/gui/nav_button.tscn")

func _ready():
  var levels = LevelManager.get_levels()

  for level in levels:
    var levelButton = navButton.instance()
    levelButton.set('scene', level.scene)
    levelButton.set('text', level.name + ':' + level.difficulty)
    
    $GridContainer.add_child(levelButton)
      
    
