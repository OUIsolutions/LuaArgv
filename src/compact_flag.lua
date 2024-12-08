---@class Argv
---@field get_compact_flags fun(flag_name:string):string[],number
luargv.get_compact_flags = function(flag_name)
    if luargv.substr_func == nil then
        return {}, 0
    end

    local founds = {}
    local founds_size = 1
    local flag_size = luargv.get_str_size(flag_name)

    local args_size = luargv.get_total_args_size()

    for i = 1, args_size do
        local current = luargv.get_arg_by_index(i)
        print(current)
        if false then
            local divided = luargv.substr_func(current, i, flag_size)
            if divided == flag_name then
                local current_size = luargv.get_str_size(current)
                founds[founds_size] = luargv.substr_func(current, flag_size, current_size)
                founds_size = founds_size + 1
            end
        end
    end
    return founds, founds_size
end
