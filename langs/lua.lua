syntax.rules("**/*.lua", {
	keyword = "and|break|do|else|elseif|end|for|function|if|in|local|not|or|repeat|return|then|until|while",
	symbol = "+|-|*|/|%%|^|#|<|>|=|~|%(|%)|%{|%}|%[|%]|;|:|,|%.|%.%.|%.%.%.",
	literal = "nil|false|true|_G|_ENV|%d{%w%._}",
	string = "'{(\\')!'.}|\"{(\\\")!\".}|%[%[{!(%]%]).}",
	comment = "--{.}|--%[%[{!(%]%]).$}",
})
