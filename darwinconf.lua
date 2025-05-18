local project = darwin.create_project("luargv")
project.add_lua_code("private_luargv =  {}")
project.add_lua_code("luargv = {}")
project.add_lua_code("private_lua_argv_string_functions = {}")

local concat_path = true
local src_files = darwin.dtw.list_files_recursively("src", concat_path)
for i = 1, #src_files do
    local current = src_files[i]
    project.add_lua_code("-- file: " .. current .. "\n")
    project.add_lua_file(current)
end
project.add_lua_code("return luargv")

project.generate_lua_file({
    output = "luargv.lua"
})
