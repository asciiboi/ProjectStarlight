extends Area

var overlap
var can_speak = false

func _ready():
	Dialogic.load()

func _process(delta):
	can_speak = !!overlap
	if Input.is_action_just_pressed("speak"):
		if overlap and !get_parent().speaking:
			var dialog = Dialogic.start(overlap[0].timeline_name)
			add_child(dialog)

func _physics_process(delta):
	overlap = get_overlapping_areas()
	
