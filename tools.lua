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
	local command = [[fd -tf --path-separator / . | fzf | xargs -rI FILE pepper --as-focused-client "FILE" ]]
	process.spawn("conhost", {"sh", "-c", command})
end

function fzf_windows_terminal()
	windows_terminal_run_command_on_split([[fd -tf --path-separator / . | fzf | xargs -rI FILE pepper --as-focused-client `"FILE`"]])
end

function fzf()
	--fzf_conhost()
	fzf_windows_terminal()
end
--keymap.normal("<c-o>", ":fzf()<enter>")

function find_file()
	picker.reset()
	picker.prompt("open:")
	
	local picked = false
	process.stream("fd", {"-tf", "--path-separator", "/", "."}, nil, function(output)
		if picked or output == nil then
			return
		end
		for file in string.gmatch(output, "[^\r\n]+") do
			picker.entry(file)
		end
	end)
	
	picker.pick(function(file)
		picked = true
		if file then
			buffer.open(file)
		end
	end)
end
keymap.normal("<c-o>", ":find_file()<enter>")

function ripgrep()
	read_line.prompt("rg:")
	read_line.read(function(search_pattern)
		if search_pattern == nil then
			return
		end
		
		picker.reset()
		picker.prompt("jump:")
		
		local args = {"--line-number"}
		local buffer_path = buffer.path()
		if buffer_path ~= nil then
			local extension = string.match(buffer_path, "[^%.]%.(%w+)$")
			if extension ~= nil then
				args[#args + 1] = "--type-add"
				args[#args + 1] = "t:*." .. extension
				args[#args + 1] = "-tt"
			end
		end
		args[#args + 1] = search_pattern
		
		local picked = false
		process.stream("rg", args, nil, function(output)
			if picked or output == nil then
				return
			end
			for match in string.gmatch(output, "[^\r\n]+") do
				local file, line, text = string.match(match, "([^:]+):([^:]+):%s*(.*)")
				picker.entry(file .. ":" .. line, text)
			end
		end)
		
		picker.pick(function(file_and_line)
			picked = true
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