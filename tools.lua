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
	-- this command will pipe fd to fzf then, when it returns, it will call pepper with '--as-focused-client'
	-- which will let us pass commands to the currently focused client (the one which invoked this function)
	-- in this case, we use it to tell that client to open a new file
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
		-- this callback is called whenever there's new output from the spawned process
		-- and once more at the end with 'output = nil' to indicate that the process finished
		if picked or output == nil then
			return
		end
		-- iterate over 'output' lines
		for file in string.gmatch(output, "[^\r\n]+") do
			picker.entry(file)
		end
	end)
	
	picker.pick(function(file)
		picked = true
		-- if a file was picked, open it
		if file then
			buffer.open(file)
		end
	end)
end
keymap.normal("<c-o>", ":find_file()<enter>")

function ripgrep()
	read_line.prompt("rg:")
	-- first a search pattern is read from the user
	read_line.read(function(search_pattern)
		-- early return if action was canceled
		if search_pattern == nil then
			return
		end
		
		picker.reset()
		picker.prompt("jump:")
		
		local args = {"--line-number"}
		local buffer_path = buffer.path()
		-- maybe restrict searched files based on their extension
		if buffer_path ~= nil then
			local extension = string.match(buffer_path, "[^%.]%.(%w+)$")
			if extension ~= nil then -- only search files with the same extension as current buffer
				args[#args + 1] = "--type-add"
				args[#args + 1] = "t:*." .. extension
				args[#args + 1] = "-tt"
			end
		end
		args[#args + 1] = search_pattern
		
		local picked = false
		process.stream("rg", args, nil, function(output)
			-- this callback is called whenever there's new output from the spawned process
			-- and once more at the end with 'output = nil' to indicate that the process finished
			if picked or output == nil then
				return
			end
			-- iterate over 'output' lines
			for match in string.gmatch(output, "[^\r\n]+") do
				local file, line, text = string.match(match, "([^:]+):([^:]+):%s*(.*)")
				picker.entry(file .. ":" .. line, text)
			end
		end)
		
		picker.pick(function(file_and_line)
			picked = true
			-- early return if no file was picked
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