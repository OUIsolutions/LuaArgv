-- ############################################
-- Public types for the LuaArgv library
-- ############################################

---@class Argv
---@field argslist string[] Complete list of command-line arguments
---@field used_args number[] Indices of arguments that have been used
---@field flag_identifiers string[] Identifiers recognized as flags (e.g., {"-", "--"})
---
---@field get_flag_size fun(flags:string[]|string):number Returns the number of values associated with a flag
---@field get_flag_arg_by_index fun(flags:string[]|string,index:number,default:string|nil):string|nil Returns the flag value by index
---@field flags_exist fun(flags:string[]):boolean Checks if any of the flags exist
---@field get_flag_size_consider_only_first fun(flags:string[]|string):number Returns the number of occurrences considering only the first flag
---@field get_flag_arg_by_index_consider_only_first fun(flags:string[]|string,index:number,default:string|nil):string|nil Returns the argument for the first occurrence of the flag
---@field one_of_args_exist fun(arg:string[]|string):boolean Checks if one of the arguments exists
---@field get_total_args_size fun():number Returns the total number of arguments
---@field get_arg_by_index fun(index:number):string|nil Returns argument by index
---@field get_arg_by_index_not_adding_to_used fun(index:number):string Returns argument without marking it as used
---@field get_compact_flags fun(flags:string[]|string,index:number,default:string|nil):string|nil Gets values of compact flags (e.g., -abc)
---@field get_compact_flags_size fun(flags:string[]|string):number Returns the number of compact flags
---@field add_used_args_by_index fun(used_flag:number) Marks an argument as used
---@field get_total_unused_args fun():number Returns the number of unused arguments
---@field get_unsed_arg_by_index fun(index:number):string|nil Returns unused argument by index
---@field get_next_unused_index fun():number|nil Returns the index of the next unused argument
---@field get_next_unused fun():string|nil Returns the next unused argument
---@field type fun(value:any):string Returns the type of a value
---@field substr_func fun(str:string,start:number,endnum:number):string Returns a substring of a string
---@field get_str_size fun(str:string):number Returns the length of a string

---@type Argv
luargv = luargv


-- ############################################
-- Main interface
-- ############################################

---@class LuaArgvModule
---@field argv Argv Public API to handle command-line arguments