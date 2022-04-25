extends RayCast3D

const DISTANCE = 3.4 # Max RayCast range
const THRESHOLD = 0.125
const SQUARED_THRESHOLD = THRESHOLD * THRESHOLD
var original_point: Vector3
var previous_point: Vector3
@export var type: String

signal update

# Called when the node enters the scene tree for the first time.
func _ready():	
	# Scale the range of the sensor based on the constant
	target_position *= DISTANCE
	# Save the (relative) original position of the point
	original_point = $Point.position

func check():
	if is_colliding():
		# If the RayCast collides...
		var point: Vector3 = get_collision_point()
		if point.distance_squared_to(previous_point) > SQUARED_THRESHOLD:
			# emit the distance
			update.emit(point.distance_to(global_transform.origin))
			previous_point = point
			# move the point to the (global) collision point
			$Point.top_level = true
			$Point.position = point
	else:
		if previous_point != Vector3.ZERO:
			update.emit(-1)
			previous_point = Vector3.ZERO
		# Otherwise, set it back to the (relative) original position
		$Point.top_level = false
		$Point.position = original_point
