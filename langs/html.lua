syntax.rules("**/*.html", {
	keyword = "<{%w_-}|</{%w_-}|>|/>", 
	type = "%!DOCTYPE",
	symbol = "=",
	string = "'{(\\')!'.}|\"{(\\\")!\".}",
	comment = "<%!--{!(-->).$}",
	text = "{%w_-}",
})
