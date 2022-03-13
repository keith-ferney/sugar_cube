extends Control

func _physics_process(_delta):
  var score = $"../../Player".score
  var par = $"../../".par
  var label = $ColorRect/Label
  if score > par:
    label.add_color_override("font_color", Color.red)
  label.text = "Par: "+String(score)+"/"+String(par)
  

