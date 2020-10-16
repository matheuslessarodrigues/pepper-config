local keywords = {"and", "break", "do", "else", "elseif", "end", "for", "function", "if", "in", "local", "not", "or", "repeat", "return", "then", "until", "while"}
for i,k in ipairs(keywords) do
	syntax.rule("lua", "keyword", k)
end

local symbols = {"+", "-", "*", "/", "%%", "^", "#", "<", ">", "=", "~", "%(", "%)", "%{", "%}", "%[", "%]", ";", ":", ",", "%.", "%.%.", "%.%.%."}
for i,s in ipairs(symbols) do
	syntax.rule("lua", "symbol", s)
end

syntax.rule("lua", "comment", "--{.}")
syntax.rule("lua", "comment", "--%[%[{!(%]%]).$}")

for i,l in ipairs({"nil", "false", "true", "_G", "_ENV"}) do
	syntax.rule("lua", "literal", l)
end
syntax.rule("lua", "literal", "%d{%w%._}");

syntax.rule("lua", "string", "'{(\\')!'.}");
syntax.rule("lua", "string", "\"{(\\\")!\".}");
syntax.rule("lua", "string", "%[%[{!(%]%]).}");

syntax.rule("lua", "text", "%a{%w_}");
syntax.rule("lua", "text", "_{%w_}");
