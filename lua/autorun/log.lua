--
-- log.lua
--
-- Copyright (c) 2016 rxi
--
-- This library is free software; you can redistribute it and/or modify it
-- under the terms of the MIT license. See LICENSE for details.
--

log = { _version = "0.1.0" }

log.usecolor = true
log.level = "trace"

local modes = {
    { name = "trace", color = Color(20, 98, 200) },
    { name = "debug", color = Color(105, 159, 230) },
    { name = "info", color = Color(86, 200, 20) },
    { name = "warn", color = Color(235, 180, 0) },
    { name = "error", color = Color(255, 102, 0) },
    { name = "fatal", color = Color(240, 63, 63) },
}

local levels = {}
for i, v in ipairs(modes) do
    levels[v.name] = i
end

local round = function(x, increment)
    increment = increment or 1
    x = x / increment
    return (x > 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)) * increment
end

local _tostring = tostring

local tostring = function(...)
    local t = {}
    for i = 1, select('#', ...) do
        local x = select(i, ...)
        if type(x) == "number" then
            x = round(x, 0.01)
        end
        t[#t + 1] = _tostring(x)
    end
    return table.concat(t, " ")
end

for i, x in ipairs(modes) do
    local nameupper = x.name:upper()
    log[x.name] = function(...)
        -- Return early if we're below the log level
        if i < levels[log.level] then
            return
        end

        local msg = tostring(...) .. "\n"
        local info = debug.getinfo(2, "Sl")
        local lineinfo = info.short_src .. ":" .. info.currentline

        -- Output to console
        MsgC(x.color, string.Interpolate("[{S2} {S3}]:{LINE}: ", {
            S2 = nameupper,
            S3 = os.date("%H:%M:%S"),
            LINE = lineinfo
        }), color_white, msg)

    end
end

return log