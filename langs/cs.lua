syntax_rules("**/*.cs", {
	keyword = "abstract|as|base|break|case|catch|checked|class|const|continue|default|delegate|do|else|enum|event|explicit|extern|finally|fixed|for|foreach|goto|if|implicit|in|interface|internal|is|lock|namespace|new|operator|out|override|params|private|protected|public|readonly|ref|return|sealed|sizeof|stackalloc|static|struct|switch|throw|try|typeof|unchecked|unsafe|using|virtual|volatile|while|add|alias|ascending|async|await|by|descending|dynamic|equals|from|get|global|group|into|join|let|nameof|notnull|on|orderby|partial|remove|select|set|unmanaged|value|var|when|where|yield",
	type = "bool|byte|char|decimal|double|float|int|long|object|sbyte|short|string|uint|ulong|ushort|void|%u{%w}",
	symbol = "%(|%)|%[|%]|%{|%}|:|;|,|=|<|>|+|-|/|*|%%|%.|%!|?|&|%||@",
	literal = "null|this|true|false|%d{%w%._}",
	string = "'{(\\')!'.}|\"{(\\\")!\".}",
	comment = "//{.}|/*{!(*/).$}",
})