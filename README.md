# log.lua
A tiny logging module for Lua. 

![ss](https://i.imgur.com/JTkJfE0.png)


## Installation
The [log.lua](log.lua?raw=1) file should be dropped into an garrysmod/addons/

```bash
git clone https://github.com/chadlrnsn/pretty-log.git
```

## Usage
log.lua provides 6 functions, each function takes all its arguments,
concatenates them into a string then outputs the string to the console and --
if one is set -- the log file:

* **log.trace(...)**
* **log.debug(...)**
* **log.info(...)**
* **log.warn(...)**
* **log.error(...)**
* **log.fatal(...)**

## Example
```lua
local s = function(s, ss)
    local result = s+ss
    log.trace(result)
    log.debug(result)
    log.info(result)
    log.warn(result)
    log.error(result)
    log.fatal(result)
end

s(33, 2)
```
Output 
![Output](https://i.imgur.com/JTkJfE0.png)

### Additional options
log.lua provides variables for setting additional options:

#### log.usecolor
Whether colors should be used when outputting to the console, this is `true` by
default. If you're using a console which does not support ANSI color escape
codes then this should be disabled.

<!-- #### log.level
The minimum level to log, any logging function called with a lower level than
the `log.level` is ignored and no text is outputted or written. By default this
value is set to `"trace"`, the lowest log level, such that no log messages are
ignored.

The level of each log mode, starting with the lowest log level is as follows:
`"trace"` `"debug"` `"info"` `"warn"` `"error"` `"fatal"`
 -->

## License
This library is free software; you can redistribute it and/or modify it under
the terms of the MIT license. See [LICENSE](LICENSE) for details.

