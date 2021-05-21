local color = require("feline.presets.colors")
local c = color[color.status_color]
local cc = color[color.status_color].colors
local vi_mode_utils = require("feline.providers.vi_mode")
local icons = require("feline.defaults").separators

local components = {
    left = {active = {}, inactive = {}},
    mid = {active = {}, inactive = {}},
    right = {active = {}, inactive = {}}
}

local function enabled_lsp()
    local inf = vim.lsp.diagnostic.get_count(0, "Information")
    local war = vim.lsp.diagnostic.get_count(0, "warning")
    local err = vim.lsp.diagnostic.get_count(0, "Error")
    local hi = vim.lsp.diagnostic.get_count(0, "Hint")
    local count = inf + war + err + hi
    if count <= 0 then
        return true
    else
        return false
    end
end

-- left active
-- =======================================
table.insert(
    components.left.active,
    {
        provider = "get_vim_mode",
        hl = function()
            local val = {}
            val.bg = vi_mode_utils.get_mode_color()
            val.fg = "dark"
            val.style = "bold"
            return val
        end
    }
)
table.insert(
    components.left.active,
    {
        provider = icons.right_filled,
        hl = function()
            local val = {}
            val.fg = vi_mode_utils.get_mode_color()
            val.bg = "bg2"
            return val
        end
    }
)
table.insert(
    components.left.active,
    {
        provider = "git_branch",
        hl = {bg = "bg2", fg = "light", style = "bold"},
        right_sep = {str = icons.right_filled, hl = {fg = "bg2", bg = "bg1"}}
    }
)
table.insert(
    components.left.active,
    {
        provider = "file_info",
        hl = {fg = "light", bg = "bg1", style = "bold"},
        right_sep = {str = icons.right_filled, hl = {bg = "dark", fg = "bg1"}}
    }
)
table.insert(
    components.left.active,
    {
        provider = "file_readonly",
        enabled = function()
            return vim.bo.readonly
        end,
        hl = {fg = "red", style = "bold", bg = "dark"},
        left_sep = {str = " ", hl = {bg = "dark"}}
    }
)
table.insert(
    components.left.active,
    {
        provider = "git_diff_added",
        hl = {fg = "green", style = "bold", bg = "dark"}
    }
)
table.insert(
    components.left.active,
    {
        provider = "git_diff_changed",
        hl = {fg = "yellow", style = "bold", bg = "dark"}
    }
)
table.insert(
    components.left.active,
    {
        provider = "git_diff_removed",
        hl = {fg = "red", style = "bold", bg = "dark"},
        right_sep = {str = icons.right_filled, hl = {bg = "bg2", fg = "dark"}}
    }
)

-- right active
-- =======================================
table.insert(
    components.right.active,
    {
        provider = icons.left_filled,
        hl = {fg = "bg", bg = "bg2"},
        enabled = function()
            if enabled_lsp() == false then
                return true
            end
        end
    }
)
table.insert(
    components.right.active,
    {
        provider = "diagnostic_errors",
        hl = {fg = "error"}
    }
)
table.insert(
    components.right.active,
    {
        provider = "diagnostic_warnings",
        hl = {fg = "warning"}
    }
)
table.insert(
    components.right.active,
    {
        provider = "diagnostic_hints",
        hl = {fg = "hint"}
    }
)
table.insert(
    components.right.active,
    {
        provider = "diagnostic_info",
        hl = {fg = "info"}
    }
)
table.insert(
    components.right.active,
    {
        provider = icons.left_filled,
        hl = {fg = "dark"},
        left_sep = " ",
        enabled = function()
            if enabled_lsp() == false then
                return true
            end
        end
    }
)
table.insert(
    components.right.active,
    {
        provider = icons.left_filled,
        hl = {bg = "bg2", fg = "dark"},
        enabled = function()
            if enabled_lsp() == true then
                return true
            end
        end
    }
)
table.insert(
    components.right.active,
    {
        provider = "file_encoding",
        hl = {style = "bold", bg = "dark"},
        icon = false,
        upper = false,
        right_sep = {str = " ", hl = {bg = "dark"}}
    }
)
table.insert(
    components.right.active,
    {
        provider = "",
        left_sep = {str = icons.left_filled, hl = {fg = "bg1", bg = "dark"}},
        right_sep = {str = " ", hl = {bg = "bg1"}}
    }
)
table.insert(
    components.right.active,
    {
        provider = "file_type",
        hl = {style = "bold", bg = "bg1"},
        right_sep = {str = " ", hl = {bg = "bg1"}}
    }
)
table.insert(
    components.right.active,
    {
        provider = "lsp_connected",
        enabled = function()
            return not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
        end,
        hl = {style = "bold", fg = "connected", bg = "bg1"},
        right_sep = {str = " ", hl = {bg = "bg1"}}
    }
)

table.insert(
    components.right.active,
    {
        provider = icons.left_filled,
        hl = function()
            local val = {}
            val.fg = vi_mode_utils.get_mode_color()
            val.bg = "bg1"
            return val
        end
    }
)
table.insert(
    components.right.active,
    {
        provider = " ",
        hl = function()
            local val = {}
            val.bg = vi_mode_utils.get_mode_color()
            return val
        end
    }
)
table.insert(
    components.right.active,
    {
        provider = "line_percentage",
        hl = function()
            local val = {}

            val.name = vi_mode_utils.get_mode_highlight_name()
            val.bg = vi_mode_utils.get_mode_color()
            val.fg = "dark"
            val.style = "bold"

            return val
        end
    }
)
table.insert(
    components.right.active,
    {
        provider = " " .. icons.left .. " ",
        hl = function()
            local val = {}
            val.bg = vi_mode_utils.get_mode_color()
            val.fg = "dark"
            val.style = "bold"
            return val
        end
    }
)
table.insert(
    components.right.active,
    {
        provider = "position",
        hl = function()
            local val = {}
            val.bg = vi_mode_utils.get_mode_color()
            val.fg = "dark"
            val.style = "bold"
            return val
        end
    }
)

-- left inactive
-- =======================================
table.insert(
    components.left.inactive,
    {
        provider = "file_type",
        left_sep = {str = " ", hl = {bg = "normal"}},
        hl = {fg = "dark", bg = "normal", style = "bold"},
        right_sep = {str = icons.right_filled, hl = {fg = "normal"}}
    }
)
-- right inactive
-- =======================================
table.insert(
    components.right.inactive,
    {
        provider = "position",
        hl = {bg = "normal", fg = "dark", style = "bold"},
        icon = "",
        left_sep = {str = icons.left_filled, hl = {fg = "normal"}}
    }
)

require("feline").setup(
    {
        default_fg = c.default_fg,
        default_bg = c.default_bg,
        colors = {
            bg1 = cc.bg1,
            bg2 = cc.bg2,
            dark = cc.dark,
            light = cc.light,
            normal = cc.normal,
            visual = cc.visual,
            insert = cc.insert,
            replace = cc.replace,
            command = cc.command,
            op = cc.op
        },
        vi_mode_colors = {
            NORMAL = "normal",
            OP = "op",
            INSERT = "insert",
            VISUAL = "visual",
            BLOCK = "visual",
            REPLACE = "replace",
            ["V-REPLACE"] = "replace",
            ENTER = "op",
            MORE = "dark",
            SELECT = "light",
            COMMAND = "command",
            SHELL = "light",
            TERM = "op",
            NONE = "dark"
        },
        components = components
    }
)
