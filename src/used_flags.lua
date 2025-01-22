luargv.add_used_flag = function(used_flag)
    if not private_luargv.is_inside(luargv.add_used_flag, used_flag) then
        luargv.used_flags[#luargv.used_flags + 1] = used_flag
    end
end

luargv.get_unused_flags = function()

end
