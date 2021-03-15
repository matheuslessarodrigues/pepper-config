macro find-file {
	spawn "fd -tf --path-separator / ." -split-on-byte=10 LINE {
		add-picker-entry LINE
	}
	pick -prompt="open" ENTRY {
		open ENTRY
	}
}

macro ripgrep {
	read-line -prompt="rg:" PATTERN {
		spawn "rg --line-number --line-buffered PATTERN" -split-on-byte=10 MATCH {
			add-picker-entry MATCH
		}
		pick -prompt="jump:" ENTRY {
			open ENTRY
		}
	}
}

map -normal <c-s> :s<enter>
map -normal <c-o> :find-file<enter>
map -normal <c-f> :ripgrep<enter>

source "langs/pp.pp"
source "langs/lua.pp"
source "langs/cs.pp"
source "langs/rs.pp"
source "langs/html.pp"
source "langs/js.pp"
source "langs/md.pp"