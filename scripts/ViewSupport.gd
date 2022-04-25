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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
