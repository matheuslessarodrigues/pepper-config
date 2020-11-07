syntax.rules("**.md", {
	keyword = {"#{.}$"},
	symbol = {"|", "%!", "-"},
	literal = {"%[{!%].}%({!%).}"},
	string = {"`{(\\`)!`.}"},
	text = {"{%w_}"},
})