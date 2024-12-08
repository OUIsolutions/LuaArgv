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
you can get flags by:
```lua
---@type Argv
argv = require("luargv")
local out_flags, size = argv.get_flag_args({ "out", "output", "o" })
for i = 1, size do
    print(out_flags[i])
end
```
if you run:
```shell
lua teste.lua -out test test2
```
it will appear these:
```txt
test
test2
```

## Checking if a flag exist
you can check if a flag its present our not, by:
```lua
---@type Argv
argv = require("luargv")

---@type boolean
local exist = argv.flags_exist({ "case_sensitive", "cs" })
print(exist)
```
## Compact flags
its also possible to get comppact flags (the gcc model), witch increases
readiability of the software:

```lua
---@type Argv
argv = require("luargv")

confs, size = argv.get_compact_flags("conf:")
for i = 1, size do
    print(confs[i])
end
```
if you run:
```shell
lua teste.lua conf:test a b conf:test2
```
if will show:
```txt
test
test2
```
## Configuring the project
these lib its project to run idependent from the native lua lib, so you
can configure , every aspect of the code

```lua
---@type Argv
argv = require("luargv")
argv.substr_func = string.gsub
argv.get_str_size = string.len
argv.argslist = { "a", "b", "c" }
argv.flag_identifiers = { "--", "-" }

local size = argv.get_total_args_size()
for i = 1, size do
    print(argv.get_arg_by_index(i))
end

```
