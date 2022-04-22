extends GridMap


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open("res://mazes/simple.txt", File.READ)

	while !file.eof_reached():
		var line = file.get_csv_line(" ")
		if line.size() == 6:
			var directions = {
				"north": line[2].to_int(),
				"east": line[3].to_int(),
				"south": line[4].to_int(),
				"west": line[5].to_int()
			}
			process_line(line[0].to_int(), line[1].to_int(), directions)

	file.close()

const SCALE = 5
const XOFF = 10
const YOFF = 10

func process_line(x, y, directions):
	var ax = x * SCALE + XOFF
	var ay = y * SCALE + YOFF
	
	set_block(ax, ay)
	
	if directions["north"] == 1:
		set_block(ax + 1, ay)
		set_block(ax + 2, ay)
		set_block(ax + 3, ay)
	
	if directions["south"] == 1:
		set_block(ax + 1, ay + 4)
		set_block(ax + 2, ay + 4)
		set_block(ax + 3, ay + 4)
		
	if directions["east"] == 1:
		set_block(ax + 4, ay + 1)
		set_block(ax + 4, ay + 2)
		set_block(ax + 4, ay + 3)
	
	if directions["west"] == 1:
		set_block(ax, ay + 1)
		set_block(ax, ay + 2)
		set_block(ax, ay + 3)

func set_block(x: int, y: int):
	self.set_cell_item(Vector3i(x, 0, -y), 0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
