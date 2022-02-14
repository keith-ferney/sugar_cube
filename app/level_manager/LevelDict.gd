class_name LevelDict extends Resource
export var level_name : String
export var file : PackedScene
export(String, "Easy", "Medium", "Hard") var difficulty : String
export var order: int
  
func _init(n:String, f:PackedScene, d:String,o:int):
    self.level_name = n
    self.file = f
    self.difficulty = d
    self.order = o
    
func get_level_name():
  return self.level_name
