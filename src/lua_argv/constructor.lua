---@class Argv
---@field argslist string[]
---@field decrementer number
---@field substr_func fun(str:string,start:number,endnum:number):string

luargv.argslist = arg
luargv.decrementer = 2
if string then
    luargv.substr_func = string.gsub
end
