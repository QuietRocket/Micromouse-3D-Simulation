extends RayCast3D

const DISTANCE = 3.4
var original_position: Vector3
@export var type: String

signal update

# Called when the node enters the scene tree for the first time.
func _ready():
	# Scale the range of the sensor based on the constant
	target_position *= DISTANCE
	# Save the original position of the point
	original_position = $Point.position

func check():
	if is_colliding():
		# If there is a collision...
		var point: Vector3 = get_collision_point()
		# move the point to the (global) collision point
		$Point.global_transform.origin = point
		# Emit a collision with its type
		update.emit((point - global_transform.origin).length())
	else:
		# Otherwise, set it back to the (relative) original position
		$Point.position = original_position
