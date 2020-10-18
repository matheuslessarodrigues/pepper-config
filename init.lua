require "tools"

require "langs.rs"
require "langs.lua"
require "langs.cs"
require "langs.js"
require "langs.html"

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
