syntax "**/*.rs" {
	keywords = {fn|let|const|static|if|else|match|loop|while|for|break|continue|return|mod|use|as|in|enum|struct|trait|impl|where|mut|ref|pub|unsafe|extern}
	types = {bool|u8|u16|u32|u64|usize|i8|i16|i32|i64|isize|f32|f64|str|char|%u{%w_}}
	symbols = {%(|%)|%[|%]|%{|%}|:|;|,|=|<|>|+|-|/|*|%%|%!|?|&|%||@}
	literals = {true|false|self|'\.{!'.}|'.'|b'\.{!'.}|b'.'|%d{%w%._}|'%a{%w_}}
	strings = {"{(\")!".}|b"{(\")!".}}
	comments = {//{.}|/*{!(*/).$}}
}

lsp "**/*.rs" "rust-analyzer" -log=rust-analyzer-log