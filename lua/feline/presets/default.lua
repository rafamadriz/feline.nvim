local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local b = vim.b
local fn = vim.fn

local M = {
    properties = {
        force_inactive = {
            filetypes = {},
            buftypes = {},
            bufnames = {}
        }
    },
    components = {
        left = {
            active = {},
            inactive = {}
        },
        mid = {
            active = {},
            inactive = {}
        },
        right = {
            active = {},
            inactive = {}
        }
    }
}

M.properties.force_inactive.filetypes = {
    "NvimTree",
    "dbui",
    "packer",
    "startify",
    "fugitive",
    "fugitiveblame"
}

M.properties.force_inactive.buftypes = {
    "terminal"
}

M.components.left.active[1] = {
    provider = "▊ ",
    hl = {
        fg = "skyblue"
    }
}

M.components.left.active[2] = {
    provider = "vi_mode",
    hl = function()
        local val = {}

        val.name = vi_mode_utils.get_mode_highlight_name()
        val.fg = vi_mode_utils.get_mode_color()
        val.style = "bold"

        return val
    end,
    right_sep = " "
}

M.components.left.active[3] = {
    provider = "file_info",
    hl = {
        fg = "white",
        bg = "oceanblue",
        style = "bold"
    },
    left_sep = {
        " ",
        "slant_left_2",
        {str = " ", hl = {bg = "oceanblue", fg = "NONE"}}
    },
    right_sep = {"slant_right_2", " "}
}

M.components.left.active[4] = {
    provider = "file_size",
    enabled = function()
        return fn.getfsize(fn.expand("%:p")) > 0
    end,
    right_sep = {
        " ",
        {
            str = "slant_left_2_thin",
            hl = {
                fg = "fg",
                bg = "bg"
            }
<<<<<<< HEAD
<<<<<<< HEAD
        },
        ' '
=======
        }
>>>>>>> 3cb84d5 (new providers)
=======
        }
>>>>>>> 3cb84d5 (new providers)
    }
}

M.components.left.active[5] = {
<<<<<<< HEAD
<<<<<<< HEAD
    provider = 'position',
=======
    provider = "position",
    left_sep = " ",
>>>>>>> 3cb84d5 (new providers)
=======
    provider = "position",
    left_sep = " ",
>>>>>>> 3cb84d5 (new providers)
    right_sep = {
        ' ',
        {
<<<<<<< HEAD
<<<<<<< HEAD
            str = 'slant_right_2_thin',
=======
            " ",
            str = "slant_right_2_thin",
>>>>>>> 3cb84d5 (new providers)
=======
            " ",
            str = "slant_right_2_thin",
>>>>>>> 3cb84d5 (new providers)
            hl = {
                fg = "fg",
                bg = "bg"
            }
        }
    }
}

M.components.left.active[6] = {
    provider = "diagnostic_errors",
    hl = {fg = "red"}
}

M.components.left.active[7] = {
    provider = "diagnostic_warnings",
    hl = {fg = "yellow"}
}

M.components.left.active[8] = {
    provider = "diagnostic_hints",
    hl = {fg = "cyan"}
}

M.components.left.active[9] = {
    provider = "diagnostic_info",
    hl = {fg = "skyblue"}
}

M.components.left.active[10] = {
    provider = "lsp_connected",
    hl = {fg = "skyblue"},
    left_sep = " "
}

M.components.right.active[1] = {
    provider = "git_branch",
    hl = {
        fg = "white",
        bg = "black",
        style = "bold"
    },
    right_sep = function()
        local val = {hl = {fg = "NONE", bg = "black"}}
        if b.gitsigns_status_dict then
            val.str = " "
        else
            val.str = ""
        end

        return val
    end
}

M.components.right.active[2] = {
    provider = "git_diff_added",
    hl = {
        fg = "green",
        bg = "black"
    }
}

M.components.right.active[3] = {
    provider = "git_diff_changed",
    hl = {
        fg = "orange",
        bg = "black"
    }
}

M.components.right.active[4] = {
    provider = "git_diff_removed",
    hl = {
        fg = "red",
        bg = "black"
    },
    right_sep = function()
        local val = {hl = {fg = "NONE", bg = "black"}}
        if b.gitsigns_status_dict then
            val.str = " "
        else
            val.str = ""
        end

        return val
    end
}

M.components.right.active[5] = {
    provider = "tab_width",
    hl = {
        fg = "skyblue",
        style = "bold"
    },
    left_sep = " "
}

M.components.right.active[6] = {
    provider = "line_percentage",
    hl = {
        style = "bold"
    },
    left_sep = "  ",
    right_sep = " "
}

M.components.right.active[7] = {
    provider = "scroll_bar",
    hl = {
        fg = "skyblue",
        style = "bold"
    }
}

M.components.left.inactive[1] = {
    provider = "file_type",
    hl = {
        fg = "white",
        bg = "oceanblue",
        style = "bold"
    },
    left_sep = {
        str = " ",
        hl = {
            fg = "NONE",
            bg = "oceanblue"
        }
    },
    right_sep = {
        {
            str = " ",
            hl = {
                fg = "NONE",
                bg = "oceanblue"
            }
        },
        "slant_right"
    }
}

return M
