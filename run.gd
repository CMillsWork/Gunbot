extends Node

var wish_dir : Vector3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func action(input_dir : Vector2) -> Vector3:
	return Vector3(input_dir.x, 0.0, input_dir.y)
	
	
