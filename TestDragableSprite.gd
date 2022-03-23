extends Node2D

func _ready():
	$Particles2D.emitting = false
	pass 



func _on_DraggableComponent_STOP_DRAG():
	$Particles2D.emitting = false
	#$DraggableComponent.back_to_started_postion()
	pass 


func _on_DraggableComponent_START_DRAG():
	$Particles2D.emitting = true
	pass 
