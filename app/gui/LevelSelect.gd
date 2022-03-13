extends Control



const navButton = preload("res://app/gui/nav_button.tscn")

func _ready():
  var levels = LevelManager.get_levels()

  for level in levels:
    var levelButton = navButton.instance()
    levelButton.set('scene', level.scene)
    levelButton.set('text', level.name.capitalize())
    $GridContainer.add_child(levelButton)
    var button = $GridContainer.get_children().pop_back()
      
