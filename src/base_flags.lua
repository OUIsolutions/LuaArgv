private_luargv.get_formmated_flag_if_its_a_flag = function(current_arg)
    local total_flags = private_luargv.get_array_size(luargv.flag_identifiers)
    local chose_flag_size = 0
    for i = 1, total_flags do
        local current_flag = luargv.flag_identifiers[i]
        if private_luargv.starts_with(current_arg, current_flag) then
            local current_flag_size = luargv.get_str_size(current_flag)
            if current_flag_size >= chose_flag_size then
                chose_flag_size = current_flag_size
            end
        end
    end
    -- means its a flag
    if chose_flag_size > 0 then
        local args_size = luargv.get_str_size(current_arg)
        return luargv.substr_func(current_arg, chose_flag_size + 1, args_size)
    end
    return nil
end


luargv.get_flag_args = function(flags)
    if luargv.type(flags) == "string" then
        flags = { flags }
    end

    local args_size = luargv.get_total_args_size()
    local founds = {}
    local founds_size = 0
    local capturing_flags = false

    for i = 1, args_size do
        local current = luargv.get_arg_by_index(i)
        local possible_flag = private_luargv.get_formmated_flag_if_its_a_flag(current)
        if possible_flag then
            if private_luargv.is_inside(flags, possible_flag) then
                capturing_flags = true
            else
                capturing_flags = false
            end
        end
        if capturing_flags and not possible_flag then
            founds_size = founds_size + 1
            founds[founds_size] = current
        end
    end

    return founds, founds_size
end



luargv.flags_exist = function(flags)
    local args_size = luargv.get_total_args_size()

    for i = 1, args_size do
        local current = luargv.get_arg_by_index(i)
        local possible_flag = private_luargv.get_formmated_flag_if_its_a_flag(current)
        if possible_flag then
            if private_luargv.is_inside(flags, possible_flag) then
                return true
            end
        end
    end
    return false
end

luargv.get_first_flag_value_or_default = function(flags, default)
    if luargv.type(flags) == "string" then
        flags = { flags }
    end
    local flags, size = luargv.get_flag_args(flags)
    if size == 0 then
        return default
    end
    return flags[1]
end
