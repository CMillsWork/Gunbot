extends Node

var wish_dir : Vector3 = Vector3.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func action(vector : Vector3) -> void:
	var input_dir = vector.normalized()
	wish_dir = get_parent().get_parent().global_transform.basis * Vector3(-input_dir.x, 0.0, -input_dir.y)
