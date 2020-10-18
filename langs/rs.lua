syntax.rules({"rs"}, {
	keyword = {"fn", "let", "if", "while", "for", "return", "mod", "use", "as", "in", "enum", "struct", "impl",
		"where", "mut", "pub"},
	symbol = {"%(", "%)", "%[", "%]", "%{", "%}", ":", ";", ",", "=", "<", ">", "+", "-", "/", "*", "%%", "%!",
		"?", "&", "|", "@"},
	type = {"bool", "u8", "u16", "u32", "u64", "i8", "i16", "i32", "i64", "f32", "f64", "str",
		"%u{%w}","'%a{%w_}", "%u{%w_}"},
	comment = {"//{.}", "/*{!(*/).$}"},
	literal = {"true", "false", "self", "'\\{(\\')!'.}", "'.'", "%d{%w%._}"},
	string = {"\"{(\\\")!\".}"},
	text = {"%a{%w_}", "_{%w_}"},
})
