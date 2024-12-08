---@class ArgvModule
---@field new_argv fun(args:string[]):Argv
luargv.new_argv = function(argslist)
    ---@class Argv
    ---@field argslist string[]
    ---@field decrementer number
    local self_obj               = {
        argslist = argslist,
        decrementer = 2
    }
    ---@class Argv
    ---@field arg_exist fun(arg:string):boolean
    self_obj.arg_exist           = function(item)
        return private_luargv.arg_exist(self_obj, item)
    end

    ---@class Argv
    ---@field get_arg fun(index:number):string
    self_obj.get_arg             = function(index)
        return private_luargv.get_arg(self_obj, index)
    end

    ---@class Argv
    ---@field get_total_args_size fun():number
    self_obj.get_total_args_size = function()
        return private_luargv.get_total_args_size(self_obj)
    end


    return self_obj
end
