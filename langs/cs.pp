syntax "**/*.cs" {
	keywords = {abstract|as|base|break|case|catch|checked|class|const|continue|default|delegate|do|else|enum|event|explicit|extern|finally|fixed|for|foreach|goto|if|implicit|in|interface|internal|is|lock|namespace|new|operator|out|override|params|private|protected|public|readonly|ref|return|sealed|sizeof|stackalloc|static|struct|switch|throw|try|typeof|unchecked|unsafe|using|virtual|volatile|while|add|alias|ascending|async|await|by|descending|dynamic|equals|from|get|global|group|into|join|let|nameof|not|null|on|orderby|partial|remove|select|set|unmanaged|value|var|when|where|yield}
	types = {bool|byte|char|decimal|double|float|int|long|object|sbyte|short|string|uint|ulong|ushort|void|%u{%w_}}
	symbols = {%(|%)|%[|%]|%{|%}|:|;|,|=|<|>|+|-|/|*|%%|%.|%!|?|&|%||@}
	literals = "true|false|this|'\.{!'.}|'.'|%d{%w%._}|#{%a}"
	strings = {"{(\")!".}}
	comments = {//{.}|/*{!(*/).$}}
}

lsp "**/*.cs" "omnisharp -lsp --encoding utf-8" -log=omnisharp-log