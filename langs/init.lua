local directory = script_directory(); -- remembers the directory from where this very script as loaded
local langs = {}
for i,ext in ipairs({"rs", "lua", "cs", "js", "html", "md"}) do
	langs[#langs + 1] = {
		loaded = false, -- remembers if this language was already loaded
		glob = glob_compile("**/*." .. ext),
		path = directory .. "/" .. ext .. ".lua", -- will look for a file named 'ext.lua' in the same directory
	}
end

function try_load_language(buffer_handle)
	-- will check each not loaded language if the current buffer's path
	-- matches the language's glob
	for i, lang in ipairs(langs) do
		if not lang.loaded then -- only do work if not loaded
			if buffer_path_matches(lang.glob, buffer_handle) then
				lang.loaded = true
				script_source(lang.path) -- source language script
				return
			end
		end
	end
end

buffer_on_load(try_load_language) -- try to load language when a new buffer is loaded
buffer_on_save(function(buffer_handle, new_path) -- try to load language when buffer changes its path
	if new_path then
		try_load_language(buffer_handle)
	end
end)