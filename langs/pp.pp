syntax "**/*.pp" {
	keywords={help|try|macro|spawn|read-line|add-picker-entry|pick|quit|quit-all|print|source|open|save|save-all|reload|reload-all|close|close-all|config|color|syntax|map|register|lsp-start|lsp-stop|lsp-hover|lsp-signature-help}
	symbols={\|=}

	-symbols={\|=} \
	-literals={-{%w-_}} \
	-strings={'{(\')!'.}|"{(\")!".}|%{{!%}.$}} \
	-comments={#{.}}
