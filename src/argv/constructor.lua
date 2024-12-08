---@class ArgvStart
---@field new_argv fun(args:string[]):Argv
luargv.new_argv = function(args)
    ---@class Argv
    ---@field argslist string[]
    local self_obj      = {
        argslist = args
    }
    ---@class Argv
    ---@field arg_exist fun(arg:string):boolean
    self_obj.argv_exist = function(item)
        return private_luargv.arg_exist(self_obj, item)
    end

    ---@class Argv
    ---@field get_arg fun(index:number):string
    self_obj.get_arg    = function(index)
        return private_luargv.get_arg(self_obj, index)
    end
    return self_obj
end
