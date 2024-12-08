---@class Argv
---@field arg_exist fun(arg:string):boolean
luargv.arg_exist = function(arg_value)
    local size = luargv.get_total_args_size()
    for i = 1, size do
        local current = luargv.get_arg_by_index(i)
        if current == arg_value then
            return true
        end
    end
    return false
end

---@class Argv
---@field get_total_args_size fun():number
luargv.get_total_args_size = function()
    local count = 0
    for i = -3, 1000000 do
        local current = luargv.argslist[i]
        if current then
            count = count + 1
        end

        if i > 0 and current == nil then
            return count
        end
    end

    return 0
end


---@class Argv
---@field get_arg_by_index fun(index:number):string
luargv.get_arg_by_index = function(index)
    local decrementer = 0
    for i = 0, 1000000 do
        local converted_i = i * -1
        if luargv.argslist[converted_i] == nil then
            break
        end
        decrementer = decrementer + 1
    end
    return luargv.argslist[index - decrementer]
end
