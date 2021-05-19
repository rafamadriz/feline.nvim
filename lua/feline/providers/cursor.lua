local icons = require("feline.defaults").separators
local fn = vim.fn

local M = {}

<<<<<<< HEAD
<<<<<<< HEAD
function M.position()
    return string.format('%d:%d', fn.line('.'), fn.col('.'))
=======
function M.position(component)
    local icon = component.icon or icons.line_number
    return string.format("%s %3d:%-2d", icon, fn.line("."), fn.col("."))
>>>>>>> 3cb84d5 (new providers)
=======
function M.position(component)
    local icon = component.icon or icons.line_number
    return string.format("%s %3d:%-2d", icon, fn.line("."), fn.col("."))
>>>>>>> 3cb84d5 (new providers)
end

function M.line_percentage(component)
    local curr_line = fn.line(".")
    local lines = fn.line("$")
    local icon = component.icon or icons.page

    if curr_line == 1 then
        return icons.page .. " " .. "Top"
    elseif curr_line == lines then
        return icons.page .. " " .. "Bot"
    else
<<<<<<< HEAD
<<<<<<< HEAD
        return fn.round(curr_line / lines * 100) .. '%%'
=======
        return string.format("%s %2d%%%%", icon, fn.round(curr_line / lines * 100))
>>>>>>> 3cb84d5 (new providers)
=======
        return string.format("%s %2d%%%%", icon, fn.round(curr_line / lines * 100))
>>>>>>> 3cb84d5 (new providers)
    end
end

function M.total_lines(component)
    local total = fn.line("$")
    local icon = component.icon or icons.math_l
    return string.format("%s %d", icon, total)
end

function M.tab_width(component)
    local width = vim.api.nvim_buf_get_option(0, "shiftwidth")
    local label = component.label or "TAB:"
    return string.format("%s %d", label, width)
end

function M.scroll_bar()
    local blocks = {"▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"}
    local width = 2

    local curr_line = fn.line(".")
    local lines = fn.line("$")

    local index = fn.floor(curr_line / lines * (#blocks - 1)) + 1

    return string.rep(blocks[index], width)
end

return M
