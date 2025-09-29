-- importa a lib
local luargv = require("luargv")

-- simula args
luargv.argslist = { "--name", "Gabriel", "-v" }

print("Total de args:", luargv.get_total_args_size())
print("Arg[1]:", luargv.get_arg_by_index(1))
print("Existe --name?", luargv.flags_exist({ "--name" }))
print("Valor de --name:", luargv.get_flag_arg_by_index("--name", 1, "default"))
