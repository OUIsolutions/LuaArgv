---@class Argv
---@field arg_exist fun(arg:string):boolean
luargv.arg_exist = function(arg_value)
    local size = private_luargv.get_total_args_size()
    for i = 1, size do
        local current = private_luargv.get_arg(i)
        if current == arg_value then
            return true
        end
    end
    return false
end

---@class Argv
---@field get_total_args_size fun():number
luargv.get_total_args_size = function(self_obj)
    local raw_size = private_luargv.get_array_size(luargv.argslist)
    return raw_size + luargv.decrementer
end


---@class Argv
---@field get_arg fun(index:number):string
luargv.get_arg = function(index)
    return luargv.argslist[index - luargv.decrementer]
end
