extends TextureRect
var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

func wait(sec):
	var t = Timer.new()
	t.set_wait_time(sec)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()

func _ready():

	var dict = Time.get_date_dict_from_system()
	var m = month[dict.month-1]
	var loadPath = "res://Images/Event_Calendar/" + m + ".png"

	var dir = File.new();
	var exists = dir.file_exists(loadPath)

	while (!exists):
		exists = dir.file_exists(loadPath)
		wait(0.5)

	var textureCalendar = load(loadPath)
	self.texture = textureCalendar
	pass
