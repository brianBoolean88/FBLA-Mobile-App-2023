extends Panel

onready var home = get_node("Home")
onready var email = get_node("Email")
onready var info = get_node("Info")

onready var main = get_parent()
onready var homePage = main.get_node("MainScroll")
onready var infoPage = main.get_node("InformationPage")
onready var emailPage = main.get_node("EmailPage")

onready var emailPressed = load("res://Images/AppIcons/Email Pressed.png")
onready var homePressed = load("res://Images/AppIcons/Home Pressed Icon.png")
onready var infoPressed = load("res://Images/AppIcons/Info Pressed.png")

onready var emailNormal = load("res://Images/AppIcons/Email Icon.png")
onready var homeNormal = load("res://Images/AppIcons/Home Icon.png")
onready var infoNormal = load("res://Images/AppIcons/Info Icon.png")

var chosen = Color(0.64,0.92,1)
var default = Color(1,1,1)

func _ready():
	home.texture_normal = homePressed
	pass

func _on_Home_pressed():
	homePage.visible = true
	infoPage.visible = false
	emailPage.visible = false
	home.texture_normal = homePressed
	email.texture_normal = emailNormal
	info.texture_normal = infoNormal

func _on_Email_pressed():
	homePage.visible = false
	infoPage.visible = false
	emailPage.visible = true
	home.texture_normal = homeNormal
	email.texture_normal = emailPressed
	info.texture_normal = infoNormal

func _on_Info_pressed():
	homePage.visible = false
	infoPage.visible = true
	emailPage.visible = false
	home.texture_normal = homeNormal
	email.texture_normal = emailNormal
	info.texture_normal = infoPressed
