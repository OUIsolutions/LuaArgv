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

luargv.get_flag_size = function(flags)
    if luargv.type(flags) == "string" then
        flags = { flags }
    end
    local total_found = 0
    local args_size = luargv.get_total_args_size()
    local capturing_flags = false
    for i = 1, args_size do
        local current = luargv.get_arg_by_index_not_adding_to_used(i)
        local possible_flag = private_luargv.get_formmated_flag_if_its_a_flag(current)
        if possible_flag then
            if private_luargv.is_inside(flags, possible_flag) then
                capturing_flags = true
            else
                capturing_flags = false
            end
        end

        if capturing_flags and not possible_flag then
            total_found = total_found + 1
        end
    end

    return total_found
end


luargv.get_flag_arg_by_index = function(flags, index, default)
    if luargv.type(flags) == "string" then
        flags = { flags }
    end
    local total_found = 0
    local args_size = luargv.get_total_args_size()
    local capturing_flags = false
    local possible_flag_index = nil
    for i = 1, args_size do
        local current = luargv.get_arg_by_index_not_adding_to_used(i)
        local possible_flag = private_luargv.get_formmated_flag_if_its_a_flag(current)
        if possible_flag then
            if private_luargv.is_inside(flags, possible_flag) then
                possible_flag_index = i
                capturing_flags = true
            else
                capturing_flags = false
            end
        end

        if capturing_flags and not possible_flag then
            total_found = total_found + 1
            if total_found == index then
                luargv.add_used_args_by_index(possible_flag_index)
                luargv.add_used_args_by_index(i)
                return current
            end
        end
    end

    return default
end



luargv.flags_exist = function(flags)
    local args_size = luargv.get_total_args_size()

    for i = 1, args_size do
        local current = luargv.get_arg_by_index_not_adding_to_used(i)
        local possible_flag = private_luargv.get_formmated_flag_if_its_a_flag(current)
        if possible_flag then
            if private_luargv.is_inside(flags, possible_flag) then
                return true
            end
        end
    end
    return false
end
