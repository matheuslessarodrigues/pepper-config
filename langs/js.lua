syntax.rules("**/*.js", {
	keyword = "break|export|super|case|extends|switch|catch|finally|class|for|throw|const|function|try|continue|if|typeof|debugger|import|var|default|in|of|void|delete|instanceof|while|do|new|with|else|return|yield|enum|implements|package|public|interface|private|static|let|protected|yield|async|await|abstract|float|synchronized|boolean|goto|throws|byte|int|transient|char|long|volatile|double|native|final|short|arguments|get|set",
	type = {"%u{%w}"},
	symbol = "%(|%)|%[|%]|%{|%}|:|;|,|=|<|>|+|-|/|*|%%|%.|%!|?|&|%||@",
	literal = "null|undefined|this|true|false|%d{%w%._}",
	string = [['{(\\')!'.}|"{(\\")!".}|`{(\\`)!`.}]],
	comment = "//{.}|/*{!(*/).$}",
})