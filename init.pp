macro find-file {
	spawn "fd -tf --path-separator / ." -split-on-byte=10 {
		add-picker-entry $OUTPUT
	}
	pick -prompt="open" {
		open $ENTRY
	}
}

macro ripgrep {
	read-line -prompt="rg:" {
		spawn {rg --line-number --line-buffered $LINE} -split-on-byte=10 {
			add-picker-entry $OUTPUT
		}
		pick -prompt="jump:" {
			open $ENTRY
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