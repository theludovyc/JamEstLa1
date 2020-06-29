extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dir:Vector2

const SPEED = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var hor = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var ver = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	dir = Vector2(0, ver)
	
#	pass

func _physics_process(delta):
	move_and_slide(dir * SPEED)
