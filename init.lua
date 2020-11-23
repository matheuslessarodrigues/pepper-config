require "tools"

langs = {}
for i,ext in ipairs({"rs", "lua", "cs", "js", "html", "md"}) do
	langs[#langs + 1] = {
		glob = glob.compile("**/*." .. ext),
		module = "langs." .. ext
	}
end

function try_load_language(handle)
	for i, lang in ipairs(langs) do
		if buffer.path_matches(lang.glob, handle) then
			require(lang.module)
			return
		end
	end
end
buffer.on_open(function(handle, new_buffer)
	if new_buffer then
		try_load_language(handle)
	end
end)
buffer.on_save(function(handle, new_path)
	if new_path then
		try_load_language(handle)
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