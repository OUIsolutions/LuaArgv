-- ############################################
-- Tipos públicos da biblioteca LuaArgv
-- ############################################

---@class Argv
---@field argslist string[] Lista completa de argumentos recebidos da linha de comando
---@field used_args number[] Índices de argumentos já utilizados
---@field flag_identifiers string[] Identificadores reconhecidos como flags (ex: {"-", "--"})
---
---@field get_flag_size fun(flags:string[]|string):number Retorna a quantidade de valores associados a uma flag
---@field get_flag_arg_by_index fun(flags:string[]|string,index:number,default:string|nil):string|nil Retorna o valor da flag pelo índice
---@field flags_exist fun(flags:string[]):boolean Verifica se uma das flags existe
---@field get_flag_size_consider_only_first fun(flags:string[]|string):number Retorna o número de ocorrências considerando apenas a primeira flag
---@field get_flag_arg_by_index_consider_only_first fun(flags:string[]|string,index:number,default:string|nil):string|nil Retorna argumento da primeira ocorrência da flag
---@field one_of_args_exist fun(arg:string[]|string):boolean Verifica se um dos argumentos existe
---@field get_total_args_size fun():number Retorna o número total de argumentos
---@field get_arg_by_index fun(index:number):string|nil Retorna argumento pelo índice
---@field get_arg_by_index_not_adding_to_used fun(index:number):string Retorna argumento sem marcar como usado
---@field get_compact_flags fun(flags:string[]|string,index:number,default:string|nil):string|nil Obtém valores de flags compactas (ex: -abc)
---@field get_compact_flags_size fun(flags:string[]|string):number Retorna quantidade de flags compactas
---@field add_used_args_by_index fun(used_flag:number) Marca argumento como usado
---@field get_total_unused_args fun():number Retorna número de argumentos não usados
---@field get_unsed_arg_by_index fun(index:number):string|nil Retorna argumento não usado pelo índice
---@field get_next_unused_index fun():number|nil Retorna índice do próximo argumento não usado
---@field get_next_unused fun():string|nil Retorna próximo argumento não usado
---@field type fun(value:any):string Retorna tipo de um valor
---@field substr_func fun(str:string,start:number,endnum:number):string Substring de uma string
---@field get_str_size fun(str:string):number Retorna tamanho de uma string

---@type Argv
luargv = luargv


-- ############################################
-- Tipos privados (internos da biblioteca)
-- ############################################

---@class PrivateArgv
---@field starts_with fun(str:string,target:string):boolean Verifica se uma string começa com determinado prefixo
---@field get_array_size fun(array:table):number Retorna o tamanho de um array
---@field is_inside fun(array:table,item:any):boolean Verifica se um item está dentro de um array
---@field get_formmated_flag_if_its_a_flag fun(current_arg:string):string|nil Formata e valida argumento como flag

---@type PrivateArgv
private_luargv = private_luargv


-- ############################################
-- Interface principal
-- ############################################

---@class LuaArgvModule
---@field argv Argv API pública para manipulação de argumentos
---@field _private PrivateArgv Funções internas (uso não recomendado para usuários finais)
