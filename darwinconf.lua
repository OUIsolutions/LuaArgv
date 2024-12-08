darwin.add_lua_file("types.lua")
darwin.add_lua_code("private_luargv =  {}")
darwin.add_lua_code("luargv = {}")
darwin.add_lua_code("private_lua_argv_string_functions = {}")

local concat_path = true
local src_files = dtw.list_files_recursively("src", concat_path)
for i = 1, #src_files do
    local current = src_files[i]
    darwin.add_lua_code("-- file: " .. current .. "\n")
    darwin.add_lua_file(current)
end
darwin.add_lua_code("return luargv")

darwin.generate_lua_output({
    output_name = "luargv.lua"
})
