---@class PrivateArgv
---@field arg_exist fun(self_obj:Argv,arg:string):boolean
private_luargv.arg_exist = function(self_obj, arg_value)
    for i = 1, #self_obj.argslist do
        if self_obj.argslist[i] == arg_value then
            return true
        end
    end
    return false
end


---@class PrivateArgv
---@field get_arg fun(self_obj:Argv,index:number):string
private_luargv.get_arg = function(self_obj, index)
    return self_obj.argslist[index]
end
