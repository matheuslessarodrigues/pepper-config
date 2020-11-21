require "tools"

langs = {}
for i,ext in ipairs({"rs", "lua", "cs", "js", "html", "md"}) do
	langs[#langs + 1] = {
		glob = glob.compile("**/*." .. ext),
		module = "langs." .. ext
	}
end

buffer.on_open(function(handle)
	for i,lang in ipairs(langs) do
		if buffer.path_matches(lang.glob, handle) then
			require(lang.module)
			return
		end
	end
end)

keymap.normal("<c-s>", ":s<enter>")

function run_shell()
	read_line.prompt("!")
	read_line.read(function(command)
		if command == nil then
			return
		end
	
		local stdout = process.pipe("sh", {"-c", command})
		print(stdout)
	end)
end
keymap.normal("!", ":run_shell<enter>")