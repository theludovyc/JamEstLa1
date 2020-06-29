extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var noise:OpenSimplexNoise

onready var tileMaps = [$TileMap0, $TileMap1, $TileMap2]

var delta:int = 0

func initTileMap(index:int):
	var tileMap = tileMaps[index]
	
	tileMap.noise = noise
	tileMap.generate(delta)
	
	tileMap.speed = 48
	
func initTilemaps():
	for i in tileMaps.size():
		initTileMap(i)
		delta += 20

func printTilemaps():
	for i in tileMaps:
		print(i.name)

# Called when the node enters the scene tree for the first time.
func _ready():
	noise = OpenSimplexNoise.new()
	
	noise.octaves = 4
	noise.period = 1.5
	noise.persistence = 0.3
	
	randomize()
	
	noise.seed = randi()
	
	initTilemaps()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
