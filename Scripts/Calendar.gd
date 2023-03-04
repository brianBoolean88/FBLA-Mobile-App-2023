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
	var loadPath = "res://Images/FBLA_Calendar/" + m + ".png"
	var loadPath2 = "res://Images/ERHS_Calendar/" + m + ".png"

	var dir = File.new();
	var exists = dir.file_exists(loadPath)
	var exists2 = dir.file_exists(loadPath2)
	while (!exists or !exists2):
		exists = dir.file_exists(loadPath)
		exists2 = dir.file_exists(loadPath2)
		wait(0.5)

	var Calendar1 = self
	var Calendar2 = get_parent().get_node("Calendar2")

	var textureCalendar = load(loadPath)
	var textureCalendar2 = load(loadPath2)
	Calendar1.texture = textureCalendar
	Calendar2.texture = textureCalendar2
	pass
