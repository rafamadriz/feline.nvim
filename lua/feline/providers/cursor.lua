local icons = require("feline.defaults").separators
local fn = vim.fn

local M = {}

function M.position(component)
    local icon = component.icon or icons.line_number
    return string.format("%s%4d:%-3d", icon, fn.line("."), fn.col("."))
end

function M.line_percentage(component)
    local curr_line = fn.line(".")
    local lines = fn.line("$")
    local icon = component.icon or icons.page

    if curr_line == 1 then
        return icon .. "  Top"
    elseif curr_line == lines then
        return icon .. "  Bot"
    else
        return string.format("%s %3d%%%%", icon, fn.round(curr_line / lines * 100))
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
