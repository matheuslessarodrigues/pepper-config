local keywords = {"fn", "let", "if", "while", "for", "return", "mod", "use", "as", "in", "enum", "struct", "impl", "where", "mut", "pub"}
for i,k in ipairs(keywords) do
	syntax.rule("rs", "keyword", k)
end

local symbols = {"%(", "%)", "%[", "%]", "%{", "%}", ":", ";", ",", "=", "<", ">", "+", "-", "/", "*", "%%", "%!", "?", "&", "|", "@"}for i,s in ipairs(symbols) do
	syntax.rule("rs", "symbol", s)
end

local types = {"bool", "u8", "u16", "u32", "u64", "i8", "i16", "i32", "i64", "f32", "f64", "str"}
for i,t in ipairs(types) do
	syntax.rule("rs", "type", t)
end
syntax.rule("rs", "type", "%u{%w}")
syntax.rule("rs", "type", "'%a{%w_}")
syntax.rule("rs", "type", "%u{%w_}")

syntax.rule("rs", "comment", "//{.}")
syntax.rule("rs", "comment", "/*{!(*/).$}")

for i,l in ipairs({"true", "false", "self"}) do
	syntax.rule("rs", "literal", l)
end
syntax.rule("rs", "literal", "'\\{(\\')!'.}")
syntax.rule("rs", "literal", "'.'")
syntax.rule("rs", "literal", "%d{%w%._}")

syntax.rule("rs", "string", "\"{(\\\")!\".}")

syntax.rule("rs", "text", "%a{%w_}")
syntax.rule("rs", "text", "_{%w_}")
