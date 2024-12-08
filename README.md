# LuaArgv
a single file Lua Argv lib to handle argv flags, and values

## Installation
for installation , just donwload the [ArgvLib](https://github.com/OUIsolutions/LuaArgv/releases/download/0.01/luargv.lua)
by typing:
```shell
curl -L https://github.com/OUIsolutions/LuaArgv/releases/download/0.01/luargv.lua -o luargv.lua
```
and than import into your lua code:
```lua
---@type Argv
argv = require("luargv")

```
## Building from scratch
if you want to build from scracth ,you will need [Darwin](https://github.com/OUIsolutions/Darwin),
installed on your machine, on version [0.15](https://github.com/OUIsolutions/Darwin/releases/tag/0.015).
Then clone these repo, and run:
```shell
./darwin.out build
```

## Getting  normal args
```lua
---@type Argv
argv = require("luargv")

local size = argv.get_total_args_size()
for i = 1, size do
    print(argv.get_arg_by_index(i))
end
```

## Geting flags
you can get flags
