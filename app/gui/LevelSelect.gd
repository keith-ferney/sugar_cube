extends Control



const navButton = preload("res://app/gui/nav_button.tscn")

func _ready():
  var levels = LevelManager.get_levels()

  for level in levels:
    var levelButton = navButton.instance()
    levelButton.set('scene', level.scene)
    levelButton.set('text', level.name.capitalize())
    $GridContainer.add_child(levelButton)
      
func _physics_process(delta):
  # for button in $GridContainer.get_children():
  # button.rect_scale = Vector2(0.6,0.6)
  pass
    
