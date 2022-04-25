extends RigidDynamicBody3D

var follow = true

# Called when the node enters the scene tree for the first time.
func _ready():
	apply()

func apply():
	$FollowCamera.current = follow
	$TopCamera.current = !follow

func _input(event):
	if event.is_action_pressed("camera_tog"):
		follow = !follow
		apply()
