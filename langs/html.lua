syntax.rule("html", "type", "%!DOCTYPE");

syntax.rule("html", "comment", "<%!--{!(-->).$}");

syntax.rule("html", "keyword", "<{%w_-}")
syntax.rule("html", "keyword", "</{%w_-}")
syntax.rule("html", "keyword", ">")
syntax.rule("html", "keyword", "/>")

syntax.rule("html", "string", "'{(\\')!'.}");
syntax.rule("html", "string", "\"{(\\\")!\".}");

syntax.rule("html", "symbol", "=")
syntax.rule("html", "text", "{%w_-}")
