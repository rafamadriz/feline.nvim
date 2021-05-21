local fn = vim.fn
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local icons = require("feline.defaults").separators

local M = {}

local function file_icon(component, filename, extension)
    return component.icon or require "nvim-web-devicons".get_icon(filename, extension, {default = true})
end

local function is_modified(component)
    if bo.modified then
        return component.file_modified_icon or icons.pencil .. " "
    else
        return ""
    end
end

function M.file_info(component)
    local filename = fn.expand("%:t")
    local extension = fn.expand("%:e")
    if filename == "" then
        filename = "unnamed"
    end
    local icon = file_icon(component, filename, extension)
    local modified_str = is_modified(component)
    return " " .. icon .. " " .. filename .. " " .. modified_str
end

function M.file_info_and_dir(component)
    local filename = fn.expand("%:t")
    local extension = fn.expand("%:e")
    if filename == "" then
        filename = "unnamed"
    end
    local dir = fn.expand("%:p:h:t")
    local modified_str = is_modified(component)
    local icon = file_icon(component, filename, extension)
    return string.format(" %s %s/%s %s", icon, dir, filename, modified_str)
end

function M.file_size()
    local suffix = {"b", "k", "M", "G", "T", "P", "E"}
    local index = 1

    local fsize = fn.getfsize(fn.expand("%:p"))

    while fsize > 1024 and index < 7 do
        fsize = fsize / 1024
        index = index + 1
    end

    return string.format("%.2f", fsize) .. suffix[index]
end

function M.file_type()
    local type = bo.filetype
    if type == "" then
        return "no ft"
    else
        return type:upper()
    end
end

function M.file_encoding(component)
    local enc = (bo.fenc ~= "" and bo.fenc) or o.enc
    local os = icons[vim.bo.fileformat] or ""
    if component.icon == false then
        os = ""
    end
    if component.upper == false then
        return os .. " " .. enc
    else
        return os .. " " .. enc:upper()
    end
end

function M.spell_checking()
    if wo.spell then
        return " " .. icons.spell .. " "
    else
        return ""
    end
end

function M.file_readonly(component)
    local icon = component.icon or icons.locker
    if bo.readonly then
        return icon .. " "
    else
        return ""
    end
end

return M
