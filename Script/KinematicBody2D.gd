extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dir:Vector2

const SPEED = 40

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var hor = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var ver = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	dir = Vector2(hor, ver)
	
	position += dir * SPEED * delta
	
	position.x = clamp(position.x, 16, 160)

func _on_Player_body_entered(body):
	get_tree().reload_current_scene()
	pass # Replace with function body.
