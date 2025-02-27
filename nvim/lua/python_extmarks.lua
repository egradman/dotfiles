local api = vim.api

local M = {}

local molten = require("molten")
-- Namespace for extmarks
local ns_id = api.nvim_create_namespace(molten.extmark_namespace)

-- Function to add extmarks
local function add_extmarks(bufnr)
    api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
    local lines = api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for i, line in ipairs(lines) do
        if line:match("#%-%-%-") then
            api.nvim_buf_set_extmark(bufnr, ns_id, i - 1, 0, {
                virt_text = {{"⬤", "Error"}},
                virt_text_pos = "eol",
            })
        end
    end
end

-- Autocommand to track Python buffers
function M.setup()
    api.nvim_create_autocmd({"BufReadPost", "TextChanged", "TextChangedI"}, {
        pattern = "*.py",
        callback = function()
            local bufnr = api.nvim_get_current_buf()
            add_extmarks(bufnr)
        end,
    })
end

return M

