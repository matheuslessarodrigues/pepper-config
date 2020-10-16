function fzf_conhost()
	local client_arg = "--as-client " .. client.index()
	local command = [[fd.exe --path-separator / . | fzf.exe | xargs -rI FILE pepper ]] .. client_arg .. [[ FILE]]
	process.spawn("conhost", {"sh", "-c", command})
end
function fzf_windows_terminal()
	command = [[Add-Type -AssemblyName System.Windows.Forms; "$pwd" | out-file -encoding ASCII "$home/pepperdir"; [System.Windows.Forms.SendKeys]::SendWait("^+%p")]]
	process.spawn("powershell", {"-noprofile", "-nologo", "-noninteractive", "-command", command})
end
function fzf()
	--fzf_conhost()
	fzf_windows_terminal()
end
keymap.normal("<c-o>", ":fzf()<enter>")