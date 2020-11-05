function windows_terminal_run_command_on_split(command)
	local powershell_command = [[Add-Type -AssemblyName System.Windows.Forms; "]] ..
		[[cd `$(echo `"$pwd`" | tr \\ /); ]] ..
		command ..
		[[" | out-file -encoding ASCII "$home/pepper-command"; [System.Windows.Forms.SendKeys]::SendWait("^+%{f5}")]]
	process.spawn("powershell", {"-noprofile", "-nologo", "-noninteractive", "-command", powershell_command})
end

function sh()
	windows_terminal_run_command_on_split("sh")
end

function fzf_conhost()
	local client_arg = "--as-client " .. client.index()
	local command = [[fd.exe --path-separator / . | fzf.exe | xargs -rI FILE pepper ]] .. client_arg .. [[ FILE]]
	process.spawn("conhost", {"sh", "-c", command})
end

function fzf_windows_terminal()
	windows_terminal_run_command_on_split([[fd -tf --path-separator / . | fzf | xargs -rI FILE pepper --as-focused-client `"FILE`"]])
end

function fzf()
	--fzf_conhost()
	fzf_windows_terminal()
end
keymap.normal("<c-o>", ":fzf()<enter>")

function ripgrep()
	read_line.prompt("rg:")
	read_line.read(function(input)
		if input == nil then
			return
		end
		
		picker.reset()
		picker.prompt("jump:")
		
		local matches, stderr, success = process.pipe("rg", {"--line-number", input})
		if not success then
			print("error:\n" .. stderr)
			return
		end
		
		for match in string.gmatch(matches, "[^\r\n]+") do
			local file, line, text = string.match(match, "([^:]+):([^:]+):%s*(.*)")
			picker.entry(file .. ":" .. line, text)
		end
		picker.pick(function(file_and_line)
			if file_and_line == nil then
				return
			end
			
			local file, line = string.match(file_and_line, "([^:]+):([^:]+)")
			buffer.open(file, line)
		end)
	end)
end
keymap.normal("<c-f>", ":ripgrep()<enter>")

function verco()
	windows_terminal_run_command_on_split("verco")
end
v = verco