luargv.argslist = arg
luargv.flag_identifiers = { "-", "--" }
if string then
    luargv.substr_func = string.sub
    luargv.get_str_size = string.len
end
luargv.type = type

if not luargv.get_str_size then
    luargv.get_str_size = function(str)
        return #str
    end
end
