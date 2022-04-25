extends Node3D

var time: float
const REFRESH = 0.125

# Called when the node enters the scene tree for the first time.
func _ready():
	time = 0
	
	for sensor in get_children():
		sensor.update.connect(sensor_data.bind(sensor.type))

func sensor_data(distance: float, type: String):
#	print(type, ": ", distance)
	pass

func fetch():
	for sensor in get_children():
		sensor.check()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > REFRESH:
		fetch()
		time = 0
