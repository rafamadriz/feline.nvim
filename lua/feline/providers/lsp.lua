local lsp = vim.lsp
local icons = require("feline.defaults").separators
local get_current_buf = vim.api.nvim_get_current_buf
local M = {}

function M.diag_exist()
    local lsp = vim.lsp.diagnostic
    local inf = lsp.get_count(0, "Information")
    local war = lsp.get_count(0, "warning")
    local err = lsp.get_count(0, "Error")
    local hi = lsp.get_count(0, "Hint")
    local count = inf + war + err + hi
    if count <= 0 then
        return false
    else
        return true
    end
end

function M.is_lsp_attached()
    return next(lsp.buf_get_clients()) ~= nil
end

function M.lsp_connected(component)
    if not vim.tbl_isempty(lsp.buf_get_clients(0)) then
        return component.icon or icons.connected .. " "
    else
        return ""
    end
end

function M.get_diagnostics_count(severity)
    local count = vim.lsp.diagnostic.get_count(0, severity)
    return (count > 0) and count or ""
end

function M.lsp_client_names(component)
    local clients = {}
    if clients == nil then
        return ""
    end
    local icon = component.icon or " "

    for _, client in pairs(lsp.buf_get_clients()) do
        clients[#clients + 1] = icon .. client.name
    end

    return table.concat(clients, " ")
end

function M.diagnostic_errors(component)
    if vim.lsp.diagnostic.get_count(0, "Error") > 0 then
        return (component.icon or "  ") .. M.get_diagnostics_count("Error")
    else
        return ""
    end
end

function M.diagnostic_warnings(component)
    if vim.lsp.diagnostic.get_count(0, "Warning") > 0 then
        return (component.icon or "  ") .. M.get_diagnostics_count("Warning")
    else
        return ""
    end
end

function M.diagnostic_hints(component)
    if vim.lsp.diagnostic.get_count(0, "Hint") > 0 then
        return (component.icon or "  ") .. M.get_diagnostics_count("Hint")
    else
        return ""
    end
end

function M.diagnostic_info(component)
    if vim.lsp.diagnostic.get_count(0, "Information") > 0 then
        return (component.icon or "  ") .. M.get_diagnostics_count("Information")
    else
        return ""
    end
end

function M.diagnostic_errors_num(component)
    if vim.lsp.diagnostic.get_count(0, "Error") > 0 then
        return " " .. M.get_diagnostics_count("Error") .. " "
    else
        return ""
    end
end

function M.diagnostic_warnings_num(component)
    if vim.lsp.diagnostic.get_count(0, "Warning") > 0 then
        return " " .. M.get_diagnostics_count("Warning") .. " "
    else
        return ""
    end
end

function M.diagnostic_hints_num(component)
    if vim.lsp.diagnostic.get_count(0, "Hint") > 0 then
        return " " .. M.get_diagnostics_count("Hint") .. " "
    else
        return ""
    end
end

function M.diagnostic_info_num(component)
    if vim.lsp.diagnostic.get_count(0, "Information") > 0 then
        return " " .. M.get_diagnostics_count("Information") .. " "
    else
        return ""
    end
end

return M
