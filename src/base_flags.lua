---@class PrivateArgv
---@field get_formmated_flag_if_its_a_flag fun(current_arg:string):string
private_luargv.get_formmated_flag_if_its_a_flag = function(current_arg)
    local total_flags = private_luargv.get_array_size(luargv.flag_identifiers)
    local chose_flag_size = 0
    for i = 1, total_flags do
        local current_flag = luargv.flag_identifiers[i]
        if private_luargv.starts_with(current_arg, current_flag) then
            local current_flag_size = luargv.get_str_size(current_flag)
            if current_flag_size >= chose_flag_size then
                chose_flag_size = chose_flag_size
            end
        end
    end
    -- means its a flag
    if chose_flag_size > 0 then
        local args_size = luargv.get_str_size(current_arg)
        return luargv.substr_func(current_arg, chose_flag_size, args_size)
    end
    return chose_flag_size
end

---@class Argv
---@field get_flag_args fun(flag_name:string):string[],number
luargv.get_flag_args = function(flag_name)
    local founds = {}
    local founds_size = 0
    local args_size = luargv.get_total_args_size()
    local found_position = 0

    for i = 1, args_size do
        local current = luargv.get_arg_by_index(i)
        local possible_flag = private_luargv.get_formmated_flag_if_its_a_flag(current)
        if possible_flag then
            found_first = true
        end
    end
    return founds, founds_size
end
