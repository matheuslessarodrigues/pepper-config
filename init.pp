macro find-files {
	spawn "fd -tf --path-separator / ." -split-on-byte=10 {
		add-picker-entry {$OUTPUT}
	}
	pick -prompt="open" {
		open {$ENTRY}
	}
}

map -normal <c-s> :s<enter>
map -normal <c-o> :find-files<enter>
