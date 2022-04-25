extends RayCast3D

const DISTANCE = 5
var original_position: Vector3

signal update

# Called when the node enters the scene tree for the first time.
func _ready():
	# Scale the range of the sensor based on the constant
	target_position *= DISTANCE
	# Save the original position of the point
	original_position = $Point.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_colliding():
		# If there is a collision, move the point to the (global) collision point
		$Point.global_transform.origin = get_collision_point()
	else:
		# Otherwise, set it back to the (relative) original position
		$Point.position = original_position
