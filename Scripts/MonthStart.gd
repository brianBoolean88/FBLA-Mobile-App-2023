extends Label

var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
var events = {
	"March": "There are no events this month...",
	"April": "Upcoming Events: ASVAB - Spring Test 2023",
	"May": "There are no events this month...",
	"June": "There are no events this month...",
}

func _ready():
	var dict = Time.get_date_dict_from_system()
	var m = month[dict.month-1]

	self.text = "\n\n" + events[m]

	pass
