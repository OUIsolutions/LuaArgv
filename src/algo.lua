---@class PrivateArgv
---@field get_array_size fun(array:string[]):number
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
---@field starts_with fun(value:string):boolean
private_luargv.starts_with = function(str, target)

end
