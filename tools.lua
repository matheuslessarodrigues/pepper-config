function windows_terminal_run_command_on_split(command)
	local powershell_command = [[Add-Type -AssemblyName System.Windows.Forms; "]] ..
		[[cd `$(echo `"$pwd`" | tr \\ /); ]] ..
		command ..
		[[" | out-file -encoding ASCII "$home/pepper-command"; [System.Windows.Forms.SendKeys]::SendWait("^+%{f5}")]]
	process.spawn("powershell", {"-noprofile", "-nologo", "-noninteractive", "-command", powershell_command})
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

function verco()
	windows_terminal_run_command_on_split("verco")
end
v = verco
keymap.normal("gv", ":verco()<enter>")