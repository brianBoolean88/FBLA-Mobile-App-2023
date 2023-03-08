extends TextureButton

onready var info = get_parent()
onready var animation = info.get_node("Transitions")
onready var bg = info.get_parent().get_node("BG")
onready var text = info.get_node("Text")

var terms = "Welcome to FBLA CONNECT+! If you are using our app, you agree with the following terms and conditions that are stated below. Please read these terms and conditions carefully before using our app.\nhttps://docs.google.com/document/d/1ZRDI27uqB5iVhNNi5Ozj15OYsx3_I8vfUDISsf8l39Y/edit?usp=sharing"

func wait(sec):
	var t = Timer.new()
	t.set_wait_time(sec)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()

	
func _ready():
	pass

func _on_OK_pressed():
	bg.visible = false
	info.visible = false


func _on_Terms_pressed():
	bg.self_modulate.a = 0.66
	bg.visible = true
	info.visible = true
	animation.play("ShowInfo")
	text.text = terms