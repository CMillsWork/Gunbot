extends Node

@export var jump_velocity : float = 6.0
@export var look_sensitivity : float = 0.009 

var paused : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta : float) -> void:
	pass

func _input(event : InputEvent) -> void:
	var parent : CharacterBody3D = get_parent()
	var camera : Camera3D = parent.get_camera()
	
	if Input.is_action_just_pressed("walk_forward"):
		$Run.action(Vector3(0,-1,0))
	if Input.is_action_just_pressed("menu"):
		if paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			paused = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			paused = true
	else:
		$Idle.action()
	
	if event is InputEventMouseMotion:
		
		parent.rotate_y(-event.relative.x * look_sensitivity)
		camera.rotate_x(-event.relative.y * look_sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func set_velocity(vect : Vector3):
	get_parent().velocity = vect
