macro fuzzy-open-file {
	spawn "fd -tf -0 --path-separator / ." -split-on-byte=0 {
		add-picker-option %z
	}
	pick -prompt="open:" {
		open %z
	}
}

macro rg p {
	open -no-history -no-save -no-word-database "rg-find-results.refs"
	execute-keys "<esc>aad"
	replace-with-output -split-on-byte=10 "rg --line-number --path-separator / --no-ignore-global %p"
}

macro verco {
	spawn "wt -w 0 sp -p verco"
}

map -normal <c-o> :<space>fuzzy-open-file<enter>

lsp "**/*.rs" "rust-analyzer" -log=rust-analyzer-log
lsp "**/*.cs" "omnisharp -lsp --encoding utf-8" -log=omnisharp-log

