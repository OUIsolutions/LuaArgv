
luargv.get_flag_size_consider_only_first = function(flags)
    if luargv.type(flags) == "string" then
        flags = { flags }
    end

    local total_found = 0
    local args_size = luargv.get_total_args_size()
    local skip = 0
    for i = 1, args_size do

        if skip > 0 then
            skip = skip - 1
            goto continue
        end

        local current = luargv.get_arg_by_index_not_adding_to_used(i)
        local possible_flag = private_luargv.get_formmated_flag_if_its_a_flag(current)
        if possible_flag then
            if private_luargv.is_inside(flags, possible_flag) then
                total_found = total_found + 1
                skip = skip + 1
            end 
        end

        ::continue::
    end

    return total_found
end

luargv.get_flag_arg_by_index_consider_only_first = function(flags, index, default)
    if luargv.type(flags) == "string" then
        flags = { flags }
    end

    local total_found = 0
    local args_size = luargv.get_total_args_size()
    local skip = 0
    for i = 1, args_size do

        if skip > 0 then
            skip = skip - 1
            goto continue
        end

        local current = luargv.get_arg_by_index_not_adding_to_used(i)
        local possible_flag = private_luargv.get_formmated_flag_if_its_a_flag(current)
        if possible_flag then
            if private_luargv.is_inside(flags, possible_flag) then
                total_found = total_found + 1
                skip = skip + 1
            end 
            if total_found == index then
                luargv.add_used_args_by_index(i)
                return luargv.get_arg_by_index(i + 1)
            end
        end

        ::continue::
    end

    return total_found
end

