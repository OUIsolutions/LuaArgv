---@class PrivateArgv
---@field starts_with fun(str:string,target:string):boolean
private_luargv.starts_with = function(str, target)
    local target_size = luargv.get_str_size(target)
    local divided = luargv.substr_func(str, 1, target_size)

    if divided == target then
        return true
    end
    return false
end
---@class PrivateArgv
---@field get_array_size fun(array:table):number
private_luargv.get_array_size = function(array)
    local i     = 1
    local count = 0
    while array[i] do
        count = count + 1
        i = i + 1
    end
    return count
end
