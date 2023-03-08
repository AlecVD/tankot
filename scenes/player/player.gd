extends RigidBody3D

@export var MOVE_SPEED = 50.0
@export var TURN_SPEED = 150
@export var bounces = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
@onready var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var bulletObj = preload("res://scenes/bullet/bullet.tscn")
@onready var point =  get_node("Turret/Point")

func _ready():
	linear_damp = 10.0
	
func _physics_process(delta):
	# As good practice, you should replace UI actions with custom gameplay actions.
	var move_dir = 0
	var turn_dir = 0
	if Input.is_action_pressed("forward"):
		move_dir -= 1
	if Input.is_action_pressed("back"):
		move_dir += 1
	if Input.is_action_pressed("right"):
		turn_dir -= 1
	if Input.is_action_pressed("left"):
		turn_dir += 1
	
	rotation_degrees.y += turn_dir * TURN_SPEED * delta
	var move_vec = global_transform.basis.z * MOVE_SPEED * move_dir
	#move_vec.y = 0.0
	#print(move_vec)
	apply_central_force(move_vec)
	
	##velocity = move_vec
	
	##Fire Logic
	if Input.is_action_just_pressed("fire"):
		fire()
		
	
func fire():
	##Fire Bullet from Point
	#print("fire")b 
	
	var bullet = bulletObj.instantiate()
	bullet.rotation_degrees = rotation_degrees
	bullet.transform = point.get_global_transform()
	bullet.bounces = bounces
	bullet.apply_central_impulse(point.global_transform.basis.z * -10)
	#get_node("root/main").add_child(bullet)
	get_tree().get_root().get_node("Main").add_child(bullet)


func _on_body_entered(body):
	pass # Replace with function body.
