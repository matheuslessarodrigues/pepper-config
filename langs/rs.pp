syntax "**/*.rs" {
	keywords = {fn|let|if|while|for|return|mod|use|as|in|enum|struct|impl|where|mut|pub}
	types = {bool|u8|u16|u32|u64|usize|i8|i16|i32|i64|isize|f32|f64|str|%u{%w}|%u{%w_}}
	symbols = {%(|%)|%[|%]|%{|%}|:|;|,|=|<|>|+|-|/|*|%%|%!|?|&|%||@}
	literals = {true|false|self|'%a{%w_}|'\.{!'.}|'.'|%d{%w%._}}
	strings = {"{(\")!".}}
	comments = {//{.}|/*{!(*/).$}}
}