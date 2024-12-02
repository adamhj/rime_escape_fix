-- encoding=utf-8

-- 用于修复Escape键的传递bug

local M = {}

local function init(env)
    M.escape_key_cancelled = false
end

local function func(key_event, env)
    context = env.engine.context
    if (key_event:eq(KeyEvent("Escape"))) then
        log.info("!!! Escape key pressed: " .. key_event:repr())
        if (context:is_composing() or context:has_menu()) then
            log.info("!!! has_menu = true")
            context:clear()
            M.escape_key_cancelled = true
            return 1
        else
            log.info("!!! has_menu = false")
        end
    elseif (key_event:eq(KeyEvent("Release+Escape")) and M.escape_key_cancelled) then
        M.escape_key_cancelled = false
        return 1
    end 
    return 2
end

M.init = init
M.func = func

return M