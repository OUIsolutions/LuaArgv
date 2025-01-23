---@class Argv
---@field used_args number[]
---@field type fun(value:any):string
---@field argslist string[]
---@field substr_func fun(str:string,start:number,endnum:number):string
---@field get_str_size fun(str:string):number
---@field flag_identifiers string[]

luargv.argslist = arg
luargv.flag_identifiers = { "-", "--" }
luargv.used_args = {}
if string then
    luargv.substr_func = string.sub
    luargv.get_str_size = string.len
end



luargv.type = type

if not luargv.get_str_size then
    luargv.get_str_size = function(str)
        return #str
    end
end
