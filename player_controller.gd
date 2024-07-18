extends Node

@export var jump_velocity : float = 95
@export var look_sensitivity : float = 0.009 
@export var speed : float = 200

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var paused : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta : float) -> void:
	pass


func _physics_process(delta : float) -> void:
	var input_dir = Input.get_vector("strafe_left", "strafe_right", "walk_forward", "walk_back").normalized()
	var basis = get_parent().global_transform.basis
	basis.y.x = 0
	basis.y.y = 1
	basis.y.z = 0
	
	get_parent().velocity = basis * ($Run.action(input_dir) * speed) * delta
	
	# Add the gravity.
	if not get_parent().is_on_floor():
		_handle_air_physics(delta)

	# Handle jump.
	if Input.is_action_just_pressed("jump") && get_parent().is_on_floor():
		$Jump.action(jump_velocity, gravity)

func _input(event : InputEvent) -> void:
	var parent : CharacterBody3D = get_parent()
	var camera : Camera3D = parent.get_camera()
	
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


func _handle_air_physics(delta):
	get_parent().velocity.y -= gravity * delta
