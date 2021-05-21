local M = {}
local icons = require("feline.defaults").separators

function M.git_branch(component)
    local gsd = vim.b.gitsigns_status_dict

    if gsd and gsd.head and #gsd.head > 0 then
        local git = " " .. icons.git .. " "
        local icon = component.icon or git
        return icon .. gsd.head .. " "
    else
        return ""
    end
end

function M.git_diff_added(component)
    local gsd = vim.b.gitsigns_status_dict

    if gsd and gsd["added"] and gsd["added"] > 0 then
        local plus = " " .. icons.plus
        local icon = component.icon or plus
        return icon .. gsd.added
    else
        return ""
    end
end

function M.git_diff_removed(component)
    local gsd = vim.b.gitsigns_status_dict

    if gsd and gsd["removed"] and gsd["removed"] > 0 then
        local minus = " " .. icons.minus
        local icon = component.icon or minus
        return icon .. gsd.removed
    else
        return ""
    end
end

function M.git_diff_changed(component)
    local gsd = vim.b.gitsigns_status_dict

    if gsd and gsd["changed"] and gsd["changed"] > 0 then
        local tilde = " " .. icons.tilde
        local icon = component.icon or tilde
        return icon .. gsd.changed
    else
        return ""
    end
end

return M
