extends RigidBody3D

var speed = 200
var vertical_speed_increment = 0.1
var horizontal_speed_increment = 0.1

const JUMP_FORCE = 10

var input: Vector3 = Vector3.ZERO

var can_jump = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Bloc start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if input.z != 0:
		linear_velocity.z = lerpf(linear_velocity.z, speed, sign(input.z) * vertical_speed_increment * _delta)
	if input.x != 0:
		linear_velocity.x = lerpf(linear_velocity.x, speed, sign(input.x) * horizontal_speed_increment * _delta)

func _input(_event):
	input = Vector3(Input.get_action_raw_strength("right")-Input.get_action_raw_strength("left"), 0, Input.get_action_raw_strength("forward")-Input.get_action_raw_strength("slow_down"))
	
	if Input.is_action_just_pressed("jump") and can_jump:
		apply_central_impulse(Vector3(0, JUMP_FORCE, 0))
		can_jump = false

func _on_body_entered(body):
	if body is Floor:
		can_jump = true
