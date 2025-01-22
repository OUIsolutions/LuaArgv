luargv.add_used_flag_by_index = function(index)
    if not private_luargv.is_inside(luargv.used_flags, index) then
        luargv.used_flags[#luargv.used_flags + 1] = index
    end
end

luargv.get_total_unused_flags = function()
    local total       = 0
    local total_flags = luargv.get_total_args_size()
    for i = 1, total_flags do
        local current = luargv.get_arg_by_index_not_adding_to_used(i)
        if not private_luargv.is_inside(luargv.used_flags, current) then
            print(current)
            total = total + 1
        end
    end
    return total
end
