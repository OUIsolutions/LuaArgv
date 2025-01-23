# LuaArgv
a single file Lua Argv lib to handle argv flags, and values

## Installation
for installation , just donwload the [ArgvLib](https://github.com/OUIsolutions/LuaArgv/releases/download/0.07/luargv.lua)
by typing:
```shell
curl -L https://github.com/OUIsolutions/LuaArgv/releases/download/0.07/luargv.lua -o luargv.lua
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
---@type Argv
argv = require("luargv")
local index = 1
local default = "test"
local first_out_flag = argv.get_flag_arg_by_index({ "out", "output", "o" }, index, default)
print(first_out_flag)
```
if you run:
```shell
lua teste.lua -out test
```
it will appear these:
```txt
test
```


## Getting Flags Size
```lua
---@type Argv
argv = require("luargv")
local size = argv.get_flag_size({ "out", "o" })
print(size)
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

## Getting Flags by index Consider only the first
Considerring only first arg of flag, can make your conde more solid, and
easy to read:
```lua
---@type Argv
argv = require("luargv")
local index = 1
local default = "test"
local first_out_flag = argv.get_flag_arg_by_index_consider_only_first({ "out", "output", "o" }, index, default)
print(first_out_flag)
```

### Getting Flags Size Consider only the first
```lua
---@type Argv
argv = require("luargv")
local size = argv.get_flag_size_consider_only_first({ "out", "o" })
print(size)
```


## Compact flags
its also possible to get comppact flags (the gcc model), witch increases
readiability of the software:

```lua
---@type Argv
argv = require("luargv")
local index = 1
local default = "my default conf"
local first_conf = argv.get_compact_flags({ "conf:", "conf=" }, index, default)
print(first_conf)
```
if you run:
```shell
lua teste.lua conf:test a b
```
if will show:
```txt
test
```
## Compact Flags size
You also can get the compact flags size
```lua
argv = require("luargv")
local conf_flags = { "conf:", "conf=" }
local size = argv.get_compact_flags_size(conf_flags)
for i = 1, size do
    local current_conf = argv.get_compact_flags(conf_flags, i)
    print("conf " .. i .. ":" .. current_conf)
end
```
if you run:
```shell
 lua teste.lua conf=a conf:b
```
the output will be:
```txt
conf 1:b
conf 2:a
```
## Unused flags
with unsed and unused flags, you can make complex CLIS, by combining flags and args

```lua
argv = require("luargv")
--these its required to mark as used
argv.get_arg_by_index(1)
argv.get_arg_by_index(2)
local output = argv.get_flag_arg_by_index({ "out", "o" }, 1)
if not output then
    print("output its required")
    return
end
local entry = argv.get_next_unused()
if not entry then
    print("entry its required")
    return
end
local error_flag = argv.get_next_unused()
if error_flag then
    print("unused flag", error_flag)
    return
end

print("output:", output)
print("entry:", entry)

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
