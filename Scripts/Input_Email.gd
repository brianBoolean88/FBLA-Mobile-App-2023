extends TextEdit

onready var main = get_parent()
onready var imageAttach = main.get_node("FileDialog")

func _ready():
	pass


func _on_Input_focus_entered():
	if self.text == "Input lines for your email here...":
		self.text = ""
	pass

func _on_Image_pressed():
	imageAttach.popup()
	pass
