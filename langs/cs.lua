local keywords = {"abstract", "as", "base", "break", "case", "catch", "checked", "class", "const", "continue", "default", "delegate", "do", "else", "enum", "event", "explicit", "extern", "finally", "fixed", "for", "foreach", "goto", "if", "implicit", "in", "interface", "internal", "is", "lock", "namespace", "new", "operator", "out", "override", "params", "private", "protected", "public", "readonly", "ref", "return", "sealed", "sizeof", "stackalloc", "static", "struct", "switch", "throw", "try", "typeof", "unchecked", "unsafe", "using", "virtual", "volatile", "while", "add", "alias", "ascending", "async", "await", "by", "descending", "dynamic", "equals", "from", "get", "global", "group", "into", "join", "let", "nameof", "notnull", "on", "orderby", "partial", "remove", "select", "set", "unmanaged", "value", "var", "when", "where", "yield"}
for i,k in ipairs(keywords) do
	syntax.rule("cs", "keyword", k)
end

local symbols = {"%(", "%)", "%[", "%]", "%{", "%}", ":", ";", ",", "=", "<", ">", "+", "-", "/", "*", "%%", "%.", "%!", "?", "&", "|", "@"}
for i,k in ipairs(symbols) do
	syntax.rule("cs", "symbol", k)
end

local types = {"bool", "byte", "char", "decimal", "double", "float", "int", "long", "object", "sbyte", "short", "string", "uint", "ulong", "ushort", "void"}
for i,k in ipairs(types) do
	syntax.rule("cs", "type", k)
end
syntax.rule("cs", "type", "%u{%w}");

syntax.rule("cs", "comment", "//{.}");
syntax.rule("cs", "comment", "/*{!(*/).$}");

for i,k in ipairs({"null", "this", "true", "false"}) do
	syntax.rule("cs", "literal", k);
end

syntax.rule("cs", "literal", "%d{%w%._}");
syntax.rule("cs", "string", "'{(\\')!'.}");
syntax.rule("cs", "string", "\"{(\\\")!\".}");

syntax.rule("cs", "text", "%a{%w_}")
syntax.rule("cs", "text", "_{%w_}")
