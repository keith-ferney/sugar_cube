extends Control

export var title: String

func _ready():
  var label = $Label
  label.text = title
