require "tools"

buffer.on_open(function(handle)
	if buffer.has_extension("rs", handle) then require "langs.rs"
	elseif buffer.has_extension("lua", handle) then require "langs.lua"
	elseif buffer.has_extension("cs", handle) then require "langs.cs"
	elseif buffer.has_extension("js", handle) then require "langs.js"
	elseif buffer.has_extension("html", handle) then require "langs.html"
	end
end)

keymap.normal("<c-s>", ":s<enter>")

function pipe_from_input()
	read_line.prompt("!")
	read_line.read(function(input)
		if input == nil then
			return
		end
	
		local iter = string.gmatch(input, "%S+")
		local command = iter()
		local args = {}
		for a in iter do
			args[#args + 1] = a
		end
		
		local output = process.pipe(command, args)
		print(output)
	end)
end
keymap.normal("!", ":pipe_from_input()<enter>")
