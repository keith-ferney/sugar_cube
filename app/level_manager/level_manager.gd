extends Node

const levelDataClass = preload("res://app/level_manager/LevelData.gd")

var currentLevel: int
var currentLevelNode: Node2D

func process_level(command):
  if has_method(command):
    call(command)

func win():
  get_tree().call_group("gui","win")
  get_tree().paused = 1
  var instance = load("res://app/gui/winscene.tscn").instance()
  var canvas = CanvasLayer.new()
  var level = get_tree().root.get_children().pop_back()
  level.add_child(canvas)
  level.get_children().pop_back().add_child(instance)
  

func death():
  get_tree().paused = 1
  var instance = load("res://app/gui/death.tscn").instance()
  var canvas = CanvasLayer.new()
  var level = get_tree().root.get_children().pop_back()
  level.add_child(canvas)
  level.get_children().pop_back().add_child(instance)

  
#  get_tree().change_scene("res://app/gui/death.tscn")
func next_level():
  var nextLevelData = find_level_by_order(currentLevelNode.order + 1)
  get_tree().change_scene_to(nextLevelData.scene)
  
func previous_level():
  var previousLevelData = find_level_by_order(currentLevelNode.order - 1)
  get_tree().change_scene_to(previousLevelData.scene)
  
func find_level_by_order(order):
  for level in get_levels():
    if(level.order == order):
        return level
  return null
  
func get_levels() -> Array:
  return LevelManager.get_levels_from_path('res://app/levels')
  

func get_levels_from_path(path):
    var dir = Directory.new()
    var levels = []
    if dir.open(path) == OK:
        dir.list_dir_begin()
        var file_name = dir.get_next()
        var i = 1
        while file_name != "":
          if !dir.current_is_dir() and file_name.ends_with('.tscn'):
            var file_path = path+'/'+file_name
            var name = file_name.get_basename().trim_suffix('.tscn')
            var packedScene = load(file_path)
            var scene = packedScene.instance()

            levels.append(levelDataClass.new(name, packedScene, scene.get('order'), scene.get('difficulty')))
            i+=1
          file_name = dir.get_next()
          levels.sort_custom(LevelSorter, 'sort_by_order')
        return levels
    else:
        print("An error occurred when trying to access the path.")
        
class LevelSorter:
  static func sort_by_order(a: LevelData, b: LevelData):
    if a.order < b.order:
      return true
    return false

