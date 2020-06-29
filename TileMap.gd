extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var noise:OpenSimplexNoise

var speed:float

func generate(delta:int):
	for i in range(20):
		for j in range(12):
			if j == 0 or j == 11:
				set_cell(i, j, 2)
			else:
				set_cell(i, j, range_lerp(noise.get_noise_2d(i+delta, j), -1, 1, 0, 3))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed * delta
	
	if position.x < -320.0:
		position.x += 640
		
		var d = get_parent().delta
		
		generate(d)
		
		d += 20
