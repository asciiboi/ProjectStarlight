extends Area

var overlap
var can_speak = false


func _process(delta):
	can_speak = bool(overlap)

func _physics_process(delta):
	overlap = get_overlapping_areas()
	if Input.is_action_just_pressed("speak"):
		if overlap and !get_parent().speaking:
			Dialogic.load()
			var dialog = Dialogic.start(overlap[0].timeline_name)
			add_child(dialog)
