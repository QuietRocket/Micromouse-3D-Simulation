extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	for sensor in get_children():
		sensor.update.connect(sensor_data.bind(sensor.type))

func sensor_data(distance: float, type: String):
	print(type, ": ", distance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
