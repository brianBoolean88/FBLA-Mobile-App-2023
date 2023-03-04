extends Label

var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
var day = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

func _ready():
	var dict = Time.get_date_dict_from_system()
	var m = month[dict.month-1]
	var d = day[dict.weekday-1]

	var finalSyntax = d + ", " + m + " " + str(dict.day) + " " + str(dict.year)
	
	self.text = finalSyntax
	pass