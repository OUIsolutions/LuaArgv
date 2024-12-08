private_luargv.arg_exist = function(self_obj, arg_value)
    for i = 1, #self_obj.argslist do
        if self_obj.argslist[i] == arg_value then
            return true
        end
    end
    return false
end


private_luargv.get_arg = function(self_obj, index)
    return self_obj.argslist[index]
end
