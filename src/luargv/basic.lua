luargv.one_of_args_exist = function(args_list)
    if luargv.type(args_list) == "string" then
        args_list = { args_list }
    end
    for i = 1, #args_list do
        local arg_value = args_list[i]
        local size = luargv.get_total_args_size()
        for i = 1, size do
            local current = luargv.get_arg_by_index_not_adding_to_used(i)
            if current == arg_value then
                luargv.add_used_args_by_index(i)
                return true
            end
        end
        return false
    end
end

luargv.get_total_args_size = function()
    local count = 0
    for i = -3, 1000000 do
        local current = luargv.argslist[i]
        if current then
            count = count + 1
        end

        if i > 0 and current == nil then
            return count
        end
    end

    return 0
end

luargv.get_arg_by_index_not_adding_to_used = function(index)
    local decrementer = 0
    for i = 0, 1000000 do
        local converted_i = i * -1
        if luargv.argslist[converted_i] == nil then
            break
        end
        decrementer = decrementer + 1
    end
    return luargv.argslist[index - decrementer]
end

luargv.get_arg_by_index = function(index)
    luargv.add_used_args_by_index(index)
    return luargv.get_arg_by_index_not_adding_to_used(index)
end
