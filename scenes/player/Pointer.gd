extends Line2D

@export var enabled = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if(!enabled):
		hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_point_position(0,get_viewport().get_mouse_position())
	set_point_position(1,get_viewport().get_camera_3d().unproject_position(get_parent().global_position))
	pass
