extends TextEdit

onready var httpr = $HTTPRequest
onready var main = get_parent()
onready var confirm = main.get_node("TeacherConfirm")
onready var label = confirm.get_node("Label")

var headers = [
	"authority: roosevelt.cnusd.k12.ca.us",
	"accept: application/json, text/javascript, */*; q=0.01",
	"accept-language: en-US,en;q=0.5",
	"content-type: application/json; charset=UTF-8",
	"origin: https://roosevelt.cnusd.k12.ca.us",
	"referer: https://roosevelt.cnusd.k12.ca.us/staff_directory",
	"sec-fetch-dest: empty",
	"sec-fetch-mode: cors",
	"sec-fetch-site: same-origin",
	"sec-gpc: 1",
	"user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
]

var data = '{"firstRecord":0,"groupIds":[32922944,1239760,1239768,215674,1239415,1239415],"lastRecord":249,"portletInstanceId":"28300","searchTerm":"","sortOrder":"LastName,FirstName ASC","searchByJobTitle":true}'

var url = "https://roosevelt.cnusd.k12.ca.us/Common/controls/StaffDirectory/ws/StaffDirectoryWS.asmx/Search"

var teachers = []
var teacherMail = []
var currentFocusedTeacher = ""

var use_ssl = true


func _ready():
	httpr.connect("request_completed", self, "_on_request_completed")
	_make_post_request()

func _make_post_request():
	$HTTPRequest.request(url, headers, use_ssl, HTTPClient.METHOD_POST, data)

func _on_Teacher_focus_entered():
	if self.text == "Contact...":
		self.text = ""

func _on_request_completed(_result, response_code, _headers, body):
	if response_code >= 400 and response_code <= 600:
		self.text = "ERROR\n" + str(response_code)

	var json = JSON.parse(body.get_string_from_utf8())

	var dict = json.result

	for i in dict['d']['results']:
		var name = i.lastName + " " + i.firstName
		var mailURL = i.mailUrl
		teachers.append(name)
		teacherMail.append(mailURL)

	self.text = "Contact..."

func _on_Teacher_text_changed():
	var starter = self.text
	label.text = "TEACHER FINDER"
	for i in teachers:
		if starter in i: 
			label.text = "Do you mean: " + i + "?"
			currentFocusedTeacher = i

func splitSpace(oldStr):
	var new_str = ""
	for i in range(oldStr.length()):
		var c = ''
		c += oldStr[i]
		if c == c.to_upper() and i > 2:
			new_str += " "
		new_str += c
	return new_str

func _on_TeacherConfirm_pressed():
	if currentFocusedTeacher != "":
		#var spaceName = splitSpace(currentFocusedTeacher)
		self.text = currentFocusedTeacher

func _on_Send_pressed():
	var index = teachers.find(currentFocusedTeacher,0)
	var mail = teacherMail[index]
	var URL = "https://roosevelt.cnusd.k12.ca.us/" + mail
	var _send = OS.shell_open(URL)
