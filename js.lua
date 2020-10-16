local keywords = {"break", "export", "super", "case", "extends", "switch", "catch", "finally", "class", "for", "throw", "const", "function", "try", "continue", "if", "typeof", "debugger", "import", "var", "default", "in", "void", "delete", "instanceof", "while", "do", "new", "with", "else", "return", "yield", "enum", "implements", "package", "public", "interface", "private", "static", "let", "protected", "yield", "async", "await", "abstract", "float", "synchronized", "boolean", "goto", "throws", "byte", "int", "transient", "char", "long", "volatile", "double", "native", "final", "short", "arguments", "get", "set"}
for i,k in ipairs(keywords) do
	syntax.rule("js", "keyword", k)
end

local symbols = {"%(", "%)", "%[", "%]", "%{", "%}", ":", ";", ",", "=", "<", ">", "+", "-", "/", "*", "%%", "%.", "%!", "?", "&", "|", "@"}
for i,s in ipairs(symbols) do
	syntax.rule("js", "symbol", s)
end

syntax.rule("js", "type", "%u{%w}");

syntax.rule("js", "comment", "//{.}");
syntax.rule("js", "comment", "/*{!(*/).$}");

for i,l in ipairs({"null", "undefined", "this", "true", "false"}) do
	syntax.rule("js", "literal", l);
end

syntax.rule("js", "literal", "%d{%w%._}");
syntax.rule("js", "string", "'{(\\')!'.}");
syntax.rule("js", "string", "\"{(\\\")!\".}");

syntax.rule("js", "text", "%a{%w_}")
syntax.rule("js", "text", "_{%w_}")
