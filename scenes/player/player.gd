extends RigidBody3D

const MOVE_SPEED = 50.0
const TURN_SPEED = 150

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	linear_damp = 10.0
	
func _physics_process(delta):
	# As good practice, you should replace UI actions with custom gameplay actions.
	var move_dir = 0
	var turn_dir = 0
	if Input.is_action_pressed("ui_up"):
		move_dir -= 1
	if Input.is_action_pressed("ui_down"):
		move_dir += 1
	if Input.is_action_pressed("ui_right"):
		turn_dir -= 1
	if Input.is_action_pressed("ui_left"):
		turn_dir += 1
	
	rotation_degrees.y += turn_dir * TURN_SPEED * delta
	var move_vec = global_transform.basis.z * MOVE_SPEED * move_dir
	#move_vec.y = 0.0
	#print(move_vec)
	apply_central_force(move_vec)
	
	##velocity = move_vec
