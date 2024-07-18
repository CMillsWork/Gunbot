extends CharacterBody3D

# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(delta):
	move_and_slide()


func _physics_process(delta):
	pass


func get_camera() -> Camera3D:
	return $Camera3D
