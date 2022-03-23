extends Node2D

func _ready():
	$Particles2D.emitting = false
	pass 





func _on_Draggable_start_drag():
	$Particles2D.emitting = true
	pass # Replace with function body.


func _on_Draggable_stop_drag():
	$Particles2D.emitting = false
	pass # Replace with function body.
