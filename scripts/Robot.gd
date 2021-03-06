extends VehicleBody3D

const ENGINE_FORCE = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("left_inc"):
		$LeftWheel.engine_force = ENGINE_FORCE
	elif Input.is_action_pressed("left_dec"):
		$LeftWheel.engine_force = -ENGINE_FORCE
	else:
		$LeftWheel.engine_force = 0
		
	if Input.is_action_pressed("right_inc"):
		$RightWheel.engine_force = ENGINE_FORCE
	elif Input.is_action_pressed("right_dec"):
		$RightWheel.engine_force = -ENGINE_FORCE
	else:
		$RightWheel.engine_force = 0
