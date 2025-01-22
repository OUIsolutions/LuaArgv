luargv.get_compact_flags = function(flag_name)
    local founds = {}
    local founds_size = 0
    local flag_size = luargv.get_str_size(flag_name)

    local args_size = luargv.get_total_args_size()

    for i = 1, args_size do
        local current = luargv.get_arg_by_index(i)

        if private_luargv.starts_with(current, flag_name) then
            local current_size = luargv.get_str_size(current)
            founds_size = founds_size + 1
            local formmated = luargv.substr_func(current, flag_size + 1, current_size)
            founds[founds_size] = formmated
        end
    end
    return founds, founds_size
end
