---@class PrivateArgv
---@field starts_with fun(str:string,target:string):boolean
---@field get_array_size fun(array:table):number
---@field is_inside fun(array:table,item:any):number
---@field get_formmated_flag_if_its_a_flag fun(current_arg:string):string


---@class Argv
---@field used_flags string[]
---@field add_used_flag fun(used_flag:string)
---@field get_flag_size fun(flags:string[]|string):number
---@field get_flag_arg_by_index fun(flags:string[]|string,index:number,default:string | nil):string|nil
---@field flags_exist fun(flags:string[]):string[],boolean
---@field arg_exist fun(arg:string):boolean
---@field get_total_args_size fun():number
---@field get_arg_by_index_not_adding_to_used fun(index:number):string
---@field get_compact_flags fun(flag_name:string):string[],number
---@field argslist string[]
---@field decrementer number
---@field substr_func fun(str:string,start:number,endnum:number):string
---@field type fun(element:any):string
---@field get_str_size fun(str:string):number
---@field flag_identifiers string[]
