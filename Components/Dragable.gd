extends TextureButton

signal start_drag
signal stopr_drag

var _previous_parent_pos:Vector2
var _offset:Vector2
enum States { 
	Idle = 0,
	Dragged = 1
}
var state = States.Idle
var dragged_node:Node2D

func _ready():
	if is_instance_valid(get_parent()) and (get_parent() is Node2D):
		dragged_node = (get_parent() as Node2D)
	pass 

func _process(delta):
	if state == States.Dragged:
		dragged_node.global_position = get_global_mouse_position() -_offset
		pass
	pass

func _on_DraggableComponent_button_down():
	_previous_parent_pos = dragged_node.global_position
	_offset = dragged_node.get_local_mouse_position()
	state = States.Dragged
	emit_signal("START_DRAG")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass 

func _on_DraggableComponent_button_up():
	state = States.Idle
	emit_signal("STOP_DRAG")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass 

func back_to_started_postion():
	dragged_node.global_position =_previous_parent_pos
	pass
