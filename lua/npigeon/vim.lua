local M = {}

---@return string[]
M.get_visual_selection = function()
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    local start_col = vim.fn.col("'<")
    local end_col = vim.fn.col("'>")

    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    if #lines == 0 then
        return {}
    elseif #lines == 1 then
        lines[1] = string.sub(lines[1], start_col, end_col - 1)
    else
        lines[1] = string.sub(lines[1], start_col)
        lines[#lines] = string.sub(lines[#lines], 1, end_col - 1)
    end
    return lines
end


return M
