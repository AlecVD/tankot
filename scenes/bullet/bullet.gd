extends RigidBody3D

var bounces = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	#print(body.get_name())
	# Destroy self and increment bounces
	bounces -= 1
	if(bounces < 0):
		queue_free()
	#print("hit "+ str(body.get_instance_id()))
	pass # Replace with function body.
