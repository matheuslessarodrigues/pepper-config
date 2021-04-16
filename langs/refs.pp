syntax "**/*.refs" {
	keywords = {{%a/%._-!:}|%w:{%a/%._-!:}}
	symbols = {,}
	literals = {%d{%w%._}}
	strings = ""
	comments = ""
	texts = {{%w-_}}
}