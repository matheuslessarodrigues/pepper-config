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
	local text = process.pipe("copycat", {"-o"})
	if #text > 0 then
		buffer_view.insert_text(text)
	end
end
keymap.normal("Y", ":paste<enter>")

buffer.on_open(function(handle)
	if buffer.has_extension("rs", handle) then require "langs.rs"
	elseif buffer.has_extension("lua", handle) then require "langs.lua"
	elseif buffer.has_extension("cs", handle) then require "langs.cs"
	elseif buffer.has_extension("js", handle) then require "langs.js"
	elseif buffer.has_extension("html", handle) then require "langs.html"
	end
end)

keymap.normal("<c-s>", ":s<enter>")

function run_shell()
	read_line.prompt("!")
	read_line.read(function(command)
		if command == nil then
			return
		end
	
		local output = process.pipe("sh", {"-c", command})
		print(output)
	end)
end
keymap.normal("!", ":run_shell<enter>")