luargv.add_used_args_by_index = function(index)
    if index > luargv.get_total_args_size() then
        return
    end

    if not private_luargv.is_inside(luargv.used_args, index) then
        luargv.used_args[#luargv.used_args + 1] = index
    end
end

luargv.get_total_unused_args = function()
    return luargv.get_total_args_size() - #luargv.used_args
end

luargv.get_unsed_arg_by_index = function(index)
    local total       = 0
    local total_flags = luargv.get_total_args_size()
    for i = 1, total_flags do
        if not private_luargv.is_inside(luargv.used_args, i) then
            total = total + 1
            if total == index then
                return luargv.get_arg_by_index_not_adding_to_used(i)
            end
        end
    end
    return nil
end

luargv.get_next_unused_index = function()
    local total_flags = luargv.get_total_args_size()
    for i = 1, total_flags do
        if not private_luargv.is_inside(luargv.used_args, i) then
            return i
        end
    end
    return nil
end


luargv.get_next_unused = function()
    local i = luargv.get_next_unused_index()
    if i then
        return luargv.get_arg_by_index(i)
    end
    return nil
end
