local fn = vim.fn
local colors = require("feline.defaults").colors
local icons = require("feline.defaults").separators

local M = {}

local mode_alias = {
    n = "NORMAL",
    no = "OP",
    nov = "OP",
    noV = "OP",
    ["no"] = "OP",
    niI = "NORMAL",
    niR = "NORMAL",
    niV = "NORMAL",
    v = "VISUAL",
    V = "VISUAL",
    [""] = "BLOCK",
    s = "SELECT",
    S = "SELECT",
    [""] = "BLOCK",
    i = "INSERT",
    ic = "INSERT",
    ix = "INSERT",
    R = "REPLACE",
    Rc = "REPLACE",
    Rv = "V-REPLACE",
    Rx = "REPLACE",
    c = "COMMAND",
    cv = "COMMAND",
    ce = "COMMAND",
    r = "ENTER",
    rm = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    t = "TERM",
    ["null"] = "NONE"
}

M.mode_colors = {
    NORMAL = colors.normal,
    OP = colors.op,
    INSERT = colors.insert,
    VISUAL = colors.visual,
    BLOCK = colors.visual,
    REPLACE = colors.replace,
    ["V-REPLACE"] = colors.replace,
    ENTER = colors.op,
    MORE = colors.dark,
    SELECT = colors.visual,
    COMMAND = colors.command,
    SHELL = colors.light,
    TERM = colors.light,
    NONE = colors.light
}

-- Functions for statusline
function M.get_vim_mode()
    return mode_alias[fn.mode()]
end

function M.get_mode()
    return " " .. mode_alias[fn.mode()] .. " "
end

function M.get_mode_color()
    return M.mode_colors[M.get_vim_mode()]
end

-- String to title case
local function title_case(str)
    return string.gsub(string.lower(str), "%a", string.upper, 1)
end

function M.get_mode_highlight_name()
    return "Vim" .. title_case(M.get_vim_mode())
end

function M.vi_mode(component)
    if component.icon then
        if component.icon == "" then
            return M.get_vim_mode()
        else
            return component.icon
        end
    else
        return ""
    end
end

return M
