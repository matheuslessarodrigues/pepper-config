syntax "**/*.html" {
	keywords = {<{%w_-}|</{%w_-}|>|/>}
	types = {%!DOCTYPE}
	symbols = {=}
	strings = {'{(\')!'.}|"{(\")!".}}
	comments = {<%!--{!(-->).$}}
	texts = {{%w-_}}
}
