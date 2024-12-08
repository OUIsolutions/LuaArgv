---@class Argv
---@field argslist string[]
---@field decrementer number
---@field substr_func fun(str:string,start:number,endnum:number):string
---@field get_str_size fun(str:string):number

luargv.argslist = arg
if string then
    luargv.substr_func = string.sub
    luargv.get_str_size = string.len
end

if not luargv.get_str_size then
    luargv.get_str_size = function(str)
        return #str
    end
end
