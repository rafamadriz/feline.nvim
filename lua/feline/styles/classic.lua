local color = require("feline.presets.colors")
local c = color[color.status_color]
local cc = color[color.status_color].colors
local vi_mode_utils = require("feline.providers.vi_mode")

local components = {
    left = {active = {}, inactive = {}},
    mid = {active = {}, inactive = {}},
    right = {active = {}, inactive = {}}
}

-- left active
-- =======================================
table.insert(
    components.left.active,
    {
        provider = "get_vim_mode",
        hl = function()
            local val = {}

            val.name = vi_mode_utils.get_mode_highlight_name()
            val.bg = vi_mode_utils.get_mode_color()
            val.fg = "dark"
            val.style = "bold"

            return val
        end,
        right_sep = ""
    }
)
table.insert(
    components.left.active,
    {
        provider = "git_branch",
        hl = {bg = "dark", fg = "light", style = "bold"},
        right_sep = ""
    }
)
table.insert(
    components.left.active,
    {
        provider = "file_info",
        hl = {fg = "light", bg = "bg2", style = "bold"},
        right_sep = ""
    }
)
table.insert(
    components.left.active,
    {
        provider = "git_diff_added",
        hl = {fg = "green", style = "bold"}
    }
)
table.insert(
    components.left.active,
    {
        provider = "git_diff_changed",
        hl = {fg = "yellow", style = "bold"}
    }
)
table.insert(
    components.left.active,
    {
        provider = "git_diff_removed",
        hl = {fg = "red", style = "bold"}
    }
)
table.insert(
    components.left.active,
    {
        provider = "file_readonly",
        hl = {fg = "red", bg = "bg2", style = "bold"},
        right_sep = ""
    }
)

-- right active
-- =======================================
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
        provider = "file_encoding",
        hl = {style = "bold"},
        icon = false,
        upper = false,
        right_sep = " ",
        left_sep = {str = " |", hl = {fg = "light"}}
    }
)
table.insert(
    components.right.active,
    {
        provider = "file_type",
        hl = {style = "bold"},
        right_sep = " ",
        left_sep = {str = "| ", hl = {fg = "light"}}
    }
)
table.insert(
    components.right.active,
    {
        provider = "lsp_connected",
        hl = {style = "bold", fg = "connected"},
        right_sep = {str = "|", hl = {fg = "light"}}
    }
)
table.insert(
    components.right.active,
    {
        provider = "line_percentage",
        hl = {style = "bold", fg = "light", bg = "bg1"},
        right_sep = {str = " ", hl = {bg = "bg1"}},
        left_sep = {str = " ", hl = {bg = "bg1"}}
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
        end,
        icon = "",
        left_sep = ""
    }
)

-- left inactive
-- =======================================
table.insert(
    components.left.inactive,
    {
        provider = "file_type",
        hl = {fg = "insert", style = "bold"},
        left_sep = " "
    }
)
-- right inactive
-- =======================================
table.insert(
    components.right.inactive,
    {
        provider = "position",
        hl = function()
            local val = {}

            val.bg = vi_mode_utils.get_mode_color()
            val.fg = "dark"
            val.style = "bold"

            return val
        end,
        icon = "",
        left_sep = ""
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
