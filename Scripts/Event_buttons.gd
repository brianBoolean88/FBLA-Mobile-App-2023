extends TextureButton

onready var label = $Label

onready var info = get_node("../../../../../../../Info")
onready var animation = info.get_node("Transitions")
onready var bg = info.get_parent().get_node("BG")
onready var text = info.get_node("Text")

var desc = {
	'UCLA ': "Let's talk about College with two ERHS alumni @ UCLA.",
	'ASVAB - Spring test 2023': "Spring ASVAB @ Career Center. Open to students in grades 10-12 only. Register: https://bit.ly/ASVAB23s \n\n\n18 April, 2023 8:30AM - 11:30AM",
	'National Dues Payment': 'FBLA National Payments Due for Competitors, National Candidates, and Voting Delegates \n\n\n 1 March, 2023',
	'CTE Celebration Submissions Due': 'Focuses on chapter excellence and CTE Awareness. CTE Celebration tasks are designed to showcase FBLA excellence and achievements, as well as promote the mission of the organization. \n\n\n 1 March, 2023',
	'Spring Stock Market Game Registration Deadline': 'Help your students connect classroom content with a real-world experience and simulation. The Stock Market Game (SMG) gives Minnesota students in grades 4-12 the opportunity to invest a virtual $100,000 in stocks, mutual funds, and bonds.\n\n\n 4 March, 2023',
}

func _ready():
	pass

func _on_Template_pressed():
	if desc.has(label.text):
		var textT = "Name: " + label.text + "\n\n\nDesc: " + desc[label.text]

		bg.self_modulate.a = 0.66
		bg.visible = true
		info.visible = true
		animation.play("ShowInfo")
		text.text = textT
	pass
