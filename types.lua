---@class Argv
---@field argslist string[]
---@field arg_exist fun(arg:string):boolean
---@field get_arg fun(index:number):string

---@class PrivateArgv
---@field arg_exist fun(self_obj:Argv,arg:string):boolean
---@field get_arg fun(self_obj:Argv,index:number):string

---@class ArgvStart
---@field new_argv fun(args:string[]):Argv


---@type PrivateArgv
private_luargv = private_luargv

---@type ArgvStart
luargv = luargv
