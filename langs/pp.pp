syntax "**/*.pp" {
	keywords = {try|macro}
	symbols = {=|%{|%}}
	literals = {-{%w-_}}
	strings = {'{(\')!'.}|"{(\")!".}}
	comments = {#{.}}
	texts = {{%w-_}}
}
