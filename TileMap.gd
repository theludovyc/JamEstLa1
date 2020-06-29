extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var noise:OpenSimplexNoise

var speed:float

var b:bool = false

func generateStart():
	clear()
	
	for i in range(20):
		for j in range(12):
			if j == 0 or j == 11:
				set_cell(i, j, 2)
			else:
				set_cell(i, j, range_lerp(noise.get_noise_2d(i, j), -1, 1, 0, 2))

func generate(delta:int):
	clear()
	
	for i in range(20):
		for j in range(12):
			if j == 0 or j == 11:
				set_cell(i, j, 2)
			else:
				set_cell(i, j, range_lerp(noise.get_noise_2d(i+delta, j), -1, 1, 0, 3))
	
	return delta + 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !b:
		position.x -= speed * delta
		
	if Input.is_action_just_pressed("ui_accept"):
		b = !b
	
	if position.x < -320.0:
		position.x += 960 
		
		get_parent().delta = generate(get_parent().delta)
