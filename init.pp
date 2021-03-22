macro fuzzy-open-file {
	spawn "fd -tf --path-separator / ." -split-on-byte=10 LINE {
		add-picker-entry LINE
	}
	pick -prompt="open" ENTRY {
		open ENTRY
	}
}

macro rg {
	read-line -prompt="rg:" PATTERN {
		open "rg-find-results" -command="rg --line-numbers PATTERN"
	}
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