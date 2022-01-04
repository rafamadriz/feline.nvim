local lsp = vim.lsp
local icons = require("feline.defaults").separators
local get_current_buf = vim.api.nvim_get_current_buf
local M = {}

function M.diag_exist()
	local diagnostic = vim.diagnostic
	local inf = vim.tbl_count(diagnostic.get(0, { severity = diagnostic.severity.INFO }))
	local war = vim.tbl_count(diagnostic.get(0, { severity = diagnostic.severity.WARN }))
	local err = vim.tbl_count(diagnostic.get(0, { severity = diagnostic.severity.ERROR }))
	local hi = vim.tbl_count(diagnostic.get(0, { severity = diagnostic.severity.HINT }))
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
	return vim.tbl_count(vim.diagnostic.get(0, severity and { severity = severity }))
end

-- Common function used by the M.diagnostics providers
function M.diagnostics(severity)
	local count = M.get_diagnostics_count(severity)

	return count
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
	if M.diagnostics(vim.diagnostic.severity.ERROR) > 0 then
		return (component.icon or "  ") .. M.diagnostics(vim.diagnostic.severity.ERROR)
	else
		return ""
	end
end

function M.diagnostic_warnings(component)
	if M.diagnostics(vim.diagnostic.severity.WARN) > 0 then
		return (component.icon or "  ") .. M.diagnostics(vim.diagnostic.severity.WARN)
	else
		return ""
	end
end

function M.diagnostic_hints(component)
	if M.diagnostics(vim.diagnostic.severity.HINT) > 0 then
		return (component.icon or "  ") .. M.diagnostics(vim.diagnostic.severity.HINT)
	else
		return ""
	end
end

function M.diagnostic_info(component)
	if M.diagnostics(vim.diagnostic.severity.INFO) > 0 then
		return (component.icon or "  ") .. M.diagnostics(vim.diagnostic.severity.INFO)
	else
		return ""
	end
end

function M.diagnostic_errors_num(component)
	if M.diagnostics(vim.diagnostic.severity.ERROR) > 0 then
		return " " .. M.diagnostics(vim.diagnostic.severity.ERROR) .. " "
	else
		return ""
	end
end

function M.diagnostic_warnings_num(component)
	if M.diagnostics(vim.diagnostic.severity.WARN) > 0 then
		return " " .. M.diagnostics(vim.diagnostic.severity.WARN) .. " "
	else
		return ""
	end
end

function M.diagnostic_hints_num(component)
	if M.diagnostics(vim.diagnostic.severity.HINT) > 0 then
		return " " .. M.diagnostics(vim.diagnostic.severity.HINT) .. " "
	else
		return ""
	end
end

function M.diagnostic_info_num(component)
	if M.diagnostics(vim.diagnostic.severity.INFO) > 0 then
		return " " .. M.diagnostics(vim.diagnostic.severity.INFO) .. " "
	else
		return ""
	end
end

return M
