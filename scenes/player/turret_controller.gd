extends Node3D

@onready var line = get_node("Line")
@onready var camera = get_viewport().get_camera_3d()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	##Pointer Line
	var mouse_pos = get_viewport().get_mouse_position()
	line.set_point_position(0,mouse_pos)
	line.set_point_position(1,camera.unproject_position(get_node("Point").global_position))
	
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * 1000.0
	var ray = PhysicsRayQueryParameters3D.create(from,to)
	var intersection = get_world_3d().direct_space_state.intersect_ray(ray)
	#print(intersection)
	#intersection.position.y = position.y
	var pre_rotationY = rotation.x
	look_at(intersection.position,Vector3.UP)
	rotation.x = pre_rotationY
	pass
