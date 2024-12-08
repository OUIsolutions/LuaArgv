---@class PrivateArgv
---@field get_array_size fun(array:table):number
private_luargv.get_array_size = function(array)
    if array == nil then
        return 0
    end
    local i = 0
    while array[i] do
        i = i + 1
    end
    return i
end

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
