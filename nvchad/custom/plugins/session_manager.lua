
 -- local session_manager = require "session_manager"

local Path = require("plenary.path")

local M = {}

M.setup = function ()
  local status_ok, session_manager = pcall(require, "session_manager")
  if status_ok then
    session_manager.setup({
      autosave_last_session = false, -- Automatically save last session on exit and on session switch.
    })
  end
end



return M

