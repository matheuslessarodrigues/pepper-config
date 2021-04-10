macro fuzzy-open-file {
	spawn "fd -tf -0 --path-separator / ." -split-on-byte=0 LINE {
		add-picker-entry LINE
	}
	pick -prompt="open" ENTRY {
		open ENTRY
	}
}

macro rg PATTERN {
	open -no-history -no-save -no-word-database "rg-find-results"
	execute-keys "<esc>aad"
	replace-with-output -split-on-byte=10 "rg --line-number --path-separator / PATTERN"
}

map -normal <c-s> :<space>s<enter>
map -normal <c-o> :<space>fuzzy-open-file<enter>

source "langs/pp.pp"
source "langs/lua.pp"
source "langs/cs.pp"
source "langs/rs.pp"
source "langs/html.pp"
source "langs/js.pp"
source "langs/md.pp"