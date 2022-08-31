extends KinematicBody

export var gravity = 10
export (Curve) var start_curve
export (float) var acceleration_time
export (Vector3) var friction = Vector3(1,0,1)
export var top_speed = 100

var direction = Vector2.ZERO
var velocity = Vector3.ZERO
var move_time = 0.0


func _process(delta):
	update_direction()
	move_time += delta
	if direction == Vector3.ZERO:
		move_time = 0

func update_direction():
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_forward") - Input.get_action_strength("move_backward")
	direction = direction.normalized()

func sample_speed():
	return start_curve.interpolate(clamp(move_time/acceleration_time, 0, 1))*top_speed
	

func _physics_process(delta):
	var velocity_mod = Vector3.ZERO
	velocity_mod.xz = direction
	
	velocity_mod.y -= gravity
	move_and_slide(velocity, Vector3.UP)
