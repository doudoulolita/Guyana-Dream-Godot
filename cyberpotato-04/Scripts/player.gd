extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var sync_position_node: Node3D
@export var camera_z_offset = 2

# synchroniser la position avec celle de la caméra
#func _process(_delta):
	#sync_position_node.position = Vector3(position.x, sync_position_node.position.y, position.z - camera_z_offset)
	
	

func _physics_process(_delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * _delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
