local M = {}

local vi_mode = require("feline.providers.vi_mode")
local cursor = require("feline.providers.cursor")
local file = require("feline.providers.file")
local lsp = require("feline.providers.lsp")
local git = require("feline.providers.git")

M.vi_mode = vi_mode.vi_mode
M.get_vim_mode = vi_mode.get_mode

M.position = cursor.position
M.line_percentage = cursor.line_percentage
M.scroll_bar = cursor.scroll_bar
M.total_lines = cursor.total_lines
M.tab_width = cursor.tab_width

M.file_info = file.file_info
M.file_info_and_dir = file.file_info_and_dir
M.file_size = file.file_size
M.file_type = file.file_type
M.file_encoding = file.file_encoding
M.spell_checking = file.spell_checking
M.file_readonly = file.file_readonly

M.git_branch = git.git_branch
M.git_diff_added = git.git_diff_added
M.git_diff_removed = git.git_diff_removed
M.git_diff_changed = git.git_diff_changed

M.lsp_client_names = lsp.lsp_client_names
M.lsp_connected = lsp.lsp_connected
M.diagnostic_errors = lsp.diagnostic_errors
M.diagnostic_warnings = lsp.diagnostic_warnings
M.diagnostic_hints = lsp.diagnostic_hints
M.diagnostic_info = lsp.diagnostic_info

M.diag_errors_num = lsp.diagnostic_errors_num
M.diag_warnings_num = lsp.diagnostic_warnings_num
M.diag_hints_num = lsp.diagnostic_hints_num
M.diag_info_num = lsp.diagnostic_info_num

function M.add_provider(name, provider)
    if M[name] then
        print("Provider " .. name .. " already exists! Please try using another name")
    else
        M[name] = provider
    end
end

return M
