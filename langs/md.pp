syntax "**/*.md" {
	keywords = "#{.}$"
	symbols = {%||%!|-}
	literals = {%[{!%].}%({!%).}}
	strings = {```{!(```).$}|`{(\`)!`.}}
	texts = {{%w_}}
}