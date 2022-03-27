extends Control


export var levelsPerPage = 10
const navButton = preload("res://app/gui/base/nav_button.tscn")
const levelPage = preload("res://app/gui/base/LevelsPage.tscn")
var levels
var x_translate
var xChange

func _ready():
  levels = LevelManager.get_levels()
  xChange = ProjectSettings.get_setting("display/window/size/width")
  x_translate = 144 + ProjectSettings.get_setting("display/window/size/width")
  
  var page = levelPage.instance()
  $PagesContainer.add_child(page)
  var i = 0

  for level in levels:
    i += 1
    if i > levelsPerPage:
      i = 1
      var ogPos = page.rect_position
      page = levelPage.instance()
      page.rect_position = ogPos + Vector2(x_translate,40)
      $PagesContainer.add_child(page)
    
    var levelButton = navButton.instance()
    levelButton.set('scene', level.scene)
    levelButton.set('text', level.name.capitalize())
    page.add_child(levelButton)

func nextPage():
  for page in $PagesContainer.get_children():
    page.rect_position -= Vector2(xChange,0)

func lastPage():
  for page in $PagesContainer.get_children():
    page.rect_position += Vector2(xChange,0)
    
      
