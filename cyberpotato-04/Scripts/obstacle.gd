extends RigidBody3D

@export var fall_down_distance = 5
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0
	player = get_tree().get_first_node_in_group("player")
	print("loin")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print("loin")	
	var player_z_vector = Vector3(0,0, player.position.z)
	var obstacle_z_vector = Vector3(0,0, position.z)
	var distance_between = player_z_vector.distance_to(obstacle_z_vector)
	print(distance_between)
	
	if distance_between < fall_down_distance:
		gravity_scale = 1	
		print("proche")
		print(distance_between)
		print(gravity_scale)
