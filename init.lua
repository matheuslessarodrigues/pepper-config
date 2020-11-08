require "tools"

function copy()
	local selection = buffer_view.selection_text()
	if #selection > 0 then
		process.pipe("copycat", {"-i"}, selection)
	end
end
keymap.normal("y", ":copy<enter>")

function paste()
	buffer_view.delete_selection()
	local stdout, stderr, success = process.pipe("copycat", {"-o"})
	if success and #stdout > 0 then
		buffer_view.insert_text(stdout)
	end
end
keymap.normal("Y", ":paste<enter>")

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