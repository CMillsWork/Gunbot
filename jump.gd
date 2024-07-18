extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta : float) -> void:
	pass

func action(jump_velocity : float, gravity : float) -> void:
	var delta = get_physics_process_delta_time()
	#get_parent().get_parent().velocity.y += get_parent().JUMP_VELOCITY * delta
	get_parent().get_parent().velocity.y = jump_velocity #lower value
	var lerp_amount = 0.0
	
	while lerp_amount < 1:
		lerp_amount += delta
		get_parent().get_parent().velocity.y = lerp(jump_velocity, -gravity, lerp_amount)
		
		if get_parent().get_parent().is_on_floor():
			break
