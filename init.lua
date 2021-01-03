script_source("tools.lua")
script_source("langs/init.lua")

keymap_normal("<c-s>", ":s<enter>")

function run_shell()
	read_line_prompt("!")
	read_line_read(function(command)
		if command == nil then
			return
		end
	
		local stdout = process_pipe("sh", {"-c", command}) -- when this returns, the process will have finished
		print(stdout)
	end)
end
keymap_normal("!", ":run_shell<enter>")