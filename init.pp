macro fuzzy-open-file {
	spawn "fd -tf -0 --path-separator / ." -split-on-byte=0 LINE {
		add-picker-entry LINE
	}
	pick -prompt="open" ENTRY {
		open ENTRY
	}
}

macro rg PATTERN {
	open -no-history -no-save -no-word-database "rg-find-results.refs"
	execute-keys "<esc>aad"
	replace-with-output -split-on-byte=10 "rg --line-number --path-separator / PATTERN"
}

map -normal <c-s> :<space>s<enter>
map -normal <c-o> :<space>fuzzy-open-file<enter>

map -normal K :lsp-hover<enter>
map -normal gd :lsp-definition<enter>
map -normal gr {:lsp-references -context=2<enter>}
map -normal rr :lsp-rename<enter>
map -normal ra :lsp-code-action<enter>
map -normal gs :lsp-document-symbols<enter>
map -normal rf :lsp-format<enter>

source "langs/pp.pp"
source "langs/refs.pp"
source "langs/lua.pp"
source "langs/cs.pp"
source "langs/rs.pp"
source "langs/html.pp"
source "langs/js.pp"
source "langs/md.pp"