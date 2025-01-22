luargv.add_used_args_by_index = function(index)
    if not private_luargv.is_inside(luargv.used_args, index) then
        luargv.used_args[#luargv.used_args + 1] = index
    end
end


luargv.get_total_unused_args = function()
    local total       = 0
    local total_flags = luargv.get_total_args_size()
    for i = 1, total_flags do
        if not private_luargv.is_inside(luargv.used_args, i) then
            total = total + 1
        end
    end
    return total
end

luargv.get_unsed_arg_by_index = function(index)
    local total       = 0
    local total_flags = luargv.get_total_args_size()
    for i = 1, total_flags do
        if not private_luargv.is_inside(luargv.used_args, i) then
            total = total + 1
            if total == index then
                return luargv.get_arg_by_index_not_adding_to_used(index)
            end
        end
    end
    return nil
end
