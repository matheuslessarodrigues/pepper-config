syntax.rules({"html"}, {
	type = {"%!DOCTYPE"},
	comment = {"<%!--{!(-->).$}"},
	keyword = {"<{%w_-}", "</{%w_-}", ">", "/>"}, 
	string = {"'{(\\')!'.}", "\"{(\\\")!\".}"},
	symbol = {"="},
	text = {"{%w_-}"},
})
