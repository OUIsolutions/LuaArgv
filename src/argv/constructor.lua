luargv.new_argv = function(args)
    local self_obj      = {
        argslist = args
    }

    self_obj.argv_exist = function(item)
        return private_luargv.arg_exist(self_obj, item)
    end
    self_obj.get_arg    = function(index)
        return private_luargv.get_arg(self_obj, index)
    end
    return self_obj
end
