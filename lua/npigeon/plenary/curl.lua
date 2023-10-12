local curl = require("plenary.curl")

---@class PlenaryCurlResponse
---@field body table
---@field exit number
---@field headers table
---@field status number
local PlenaryCurlResponse = {}

---@params rs table|unknown|nil
---@return PlenaryCurlResponse
function PlenaryCurlResponse.x(rs)
    return setmetatable(rs, { __index = PlenaryCurlResponse })
end

---@return boolean
function PlenaryCurlResponse:ok()
    return 200 <= self.status and self.status < 300
end

---@return table
function PlenaryCurlResponse:json()
    return vim.fn.json_decode(self.body)
end

---@class PlenaryCurlParams
---@field headers table|nil
---@field body any|nil
---@field dry_run boolean|nil

local M = {}

---@param url string
---@param params PlenaryCurlParams
---@return PlenaryCurlResponse
M.post = function(url, params)
    return PlenaryCurlResponse.x(curl.post(url, params))
end

return M
