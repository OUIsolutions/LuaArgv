luargv.new_argv = function(args)
    return {
        argslist = args,
        argv_exist = function(item)
            return private_luargv.arg_exist(item)
        end
    }
end
