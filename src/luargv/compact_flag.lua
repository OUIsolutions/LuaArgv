luargv.get_compact_flags = function(flags, index, default)
    local converted_flags = flags
    if luargv.type(flags) == "string" then
        ---@type string
        flags = flags
        converted_flags = { flags }
    end


    local total = 0
    for i = 1, #flags do
        local flag_name = flags[i]
        local flag_size = luargv.get_str_size(flag_name)
        local args_size = luargv.get_total_args_size()
        for i = 1, args_size do
            local current = luargv.get_arg_by_index_not_adding_to_used(i)

            if private_luargv.starts_with(current, flag_name) then
                total = total + 1
                if total == index then
                    local current_size = luargv.get_str_size(current)
                    local formmated = luargv.substr_func(current, flag_size + 1, current_size)
                    luargv.add_used_args_by_index(i)
                    return formmated
                end
            end
        end
    end

    return default
end

luargv.get_compact_flags_size = function(flags)
    local converted_flags = flags
    if luargv.type(flags) == "string" then
        ---@type string
        flags = flags
        converted_flags = { flags }
    end
    local total = 0
    for i = 1, #flags do
        local flag_name = flags[i]
        local flag_size = luargv.get_str_size(flag_name)
        local args_size = luargv.get_total_args_size()
        for i = 1, args_size do
            local current = luargv.get_arg_by_index_not_adding_to_used(i)

            if private_luargv.starts_with(current, flag_name) then
                total = total + 1
            end
        end
    end

    return total
end
