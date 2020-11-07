syntax.rules("**.lua", {
	keyword = {"and", "break", "do", "else", "elseif", "end", "for", "function", "if", "in", "local", "not", "or",
		"repeat", "return", "then", "until", "while"},
	symbol = {"+", "-", "*", "/", "%%", "^", "#", "<", ">", "=", "~", "%(", "%)", "%{", "%}", "%[", "%]", ";",":",
		",", "%.", "%.%.", "%.%.%."},
	comment = {"--{.}", "--%[%[{!(%]%]).$}"},
	literal = {"nil", "false", "true", "_G", "_ENV", "%d{%w%._}"},
	string = {"'{(\\')!'.}", "\"{(\\\")!\".}", "%[%[{!(%]%]).}"},
	text = {"%a{%w_}", "_{%w_}"},
})