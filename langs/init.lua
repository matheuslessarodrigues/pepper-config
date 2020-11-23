local directory = script.directory();
local langs = {}
for i,ext in ipairs({"rs", "lua", "cs", "js", "html", "md"}) do
	langs[#langs + 1] = {
		glob = glob.compile("**/*." .. ext),
		path = directory .. "/" .. ext .. ".lua"
	}
end

function try_load_language(handle)
	for i, lang in ipairs(langs) do
		if buffer.path_matches(lang.glob, handle) then
			script.source(lang.path)
			return
		end
	end
end

buffer.on_load(try_load_language)
buffer.on_save(function(handle, new_path)
	if new_path then
		try_load_language(handle)
	end
end)