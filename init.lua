-- Load all modules from lua/leahevy directory in order
local i, popen = 0, io.popen
local pfile = popen('ls -a ~/.config/nvim/lua/leahevy')
if pfile ~= nil then
	for filename in pfile:lines() do
	    i = i + 1
		if filename:find("^[.]") == nil then
			local modulename = "leahevy." .. string.gsub(filename, ".lua", "")
			require(modulename)
		end
	end
	pfile:close()
end
