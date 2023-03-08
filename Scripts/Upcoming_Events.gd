extends HBoxContainer

onready var httpr = $HTTPRequest
onready var temp = $Template
onready var label = temp.get_node("Label")

var headers = [
	"authority: roosevelt.cnusd.k12.ca.us",
	"accept: application/json, text/javascript, */*; q=0.01",
	"accept-language: en-US,en;q=0.6",
	"content-type: application/json; charset=UTF-8",
	"origin: https://roosevelt.cnusd.k12.ca.us",
	"referer: https://roosevelt.cnusd.k12.ca.us/news___events/e_r_h_s_calendar",
	"sec-fetch-dest: empty",
	"sec-fetch-mode: cors",
	"sec-fetch-site: same-origin",
	"sec-gpc: 1",
	"user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36"
]

var data = '{"portletInstanceId":"139873","primaryCalendarId":"1382798","calendarIds":["1382798"],"localFromDate":"2023-03-6T08:00:00.000Z","localToDate":"2023-06-26T06:59:59.999Z","filterFieldValue":"","searchText":"","categoryFieldValue":"","filterOptions":[]}'

var url = "https://roosevelt.cnusd.k12.ca.us/Common/controls/WorkspaceCalendar/ws/WorkspaceCalendarWS.asmx/Modern_Events"

var use_ssl = true

var FBLAEvents = [
	'National Dues Payment',
	'CTE Celebration Submissions Due',
	'Spring Stock Market Game Registration Deadline',
]

func _ready():
	httpr.connect("request_completed", self, "_on_request_completed")
	_make_post_request()

func _make_post_request():
	$HTTPRequest.request(url, headers, use_ssl, HTTPClient.METHOD_POST, data)

func _on_request_completed(_result, response_code, _headers, body):
	if response_code >= 400 and response_code <= 600:
		label.text = "ERROR\n" + str(response_code)

	var json = JSON.parse(body.get_string_from_utf8())

	var dict = json.result

	for i in FBLAEvents:
		if label.text == "Loading..":
			label.text = i
		else:
			var newNode = temp.duplicate()
			var label2 = newNode.get_node("Label")
			label2.text = i
			self.add_child(newNode)

	for i in dict['d']["events"]:
		if label.text == "Loading..":
			label.text = i.name
		else:
			var newNode = temp.duplicate()
			var label2 = newNode.get_node("Label")
			label2.text = i.name
			self.add_child(newNode)
	
