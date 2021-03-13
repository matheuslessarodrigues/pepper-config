syntax "**/*.lua" {
	keywords = {and|break|do|else|elseif|end|for|function|if|in|local|not|or|repeat|return|then|until|while}
	symbols = {+|-|*|/|%%|^|#|<|>|=|~|%(|%)|%{|%}|%[|%]|;|:|,|%.|%.%.|%.%.%.}
	literals = {nil|false|true|_G|_ENV|%d{%w%._}}
	strings = {'{(\')!'.}|"{(\")!".}|%[%[{!(%]%]).}}
	comments = {--{.}|--%[%[{!(%]%]).$}}
}
