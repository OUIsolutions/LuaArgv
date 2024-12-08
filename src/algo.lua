---@class PrivateArgv
---@field starts_with fun(str:string,target:boolean):boolean
private_luargv.starts_with = function(str, target)
    if luargv.substr_func == nil then
        return false
    end
    local target_size = luargv.get_str_size(target)
    local divided = luargv.substr_func(str, 1, target_size)

    if divided == target then
        return true
    end
    return false
end
