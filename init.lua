script.source("tools.lua")
script.source("langs/init.lua")

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