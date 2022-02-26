extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Array, PackedScene) var level_data

# Called when the node enters the scene tree for the first time.
func _ready():
  var counter = 0
  for level in level_data:
    var dfficulty = level.get_state().get_node_property_value(0,3)
    var name = level.name
    var order = counter
    counter +=1  



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass
