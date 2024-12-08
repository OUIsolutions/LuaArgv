---@class PrivateArgv
---@field arg_exist fun(self_obj:Argv,arg:string):boolean
private_luargv.arg_exist = function(self_obj, arg_value)
    local size = private_luargv.get_total_args_size(self_obj)
    for i = 1, size do
        local current = private_luargv.get_arg(self_obj, i)
        if current == arg_value then
            return true
        end
    end
    return false
end

---@class PrivateArgv
---@field get_total_args_size fun(self_obj:Argv):number
private_luargv.get_total_args_size = function(self_obj)
    return #self_obj.argslist + self_obj.decrementer
end


---@class PrivateArgv
---@field get_arg fun(self_obj:Argv,index:number):string
private_luargv.get_arg = function(self_obj, index)
    return self_obj.argslist[index - self_obj.decrementer]
end
