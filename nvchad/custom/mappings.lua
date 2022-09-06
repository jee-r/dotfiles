local M = {}

M.truzen = {
   n = {
      ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
      ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
      ["<leader>tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },
   },
}

M.telescope = {
   n = {
      ["<leader>fp"] = { "<cmd> Telescope media_files <CR>", "  find media" },
   },
}

M.SessionManager = {

  n = {
    ["<leader>Sl"] = { "<cmd> SessionManager! load_last_session <CR>", "勒 Load last session" },
    ["<leader>Ss"] = { "<cmd> SessionManager! save_current_session <CR>", "ﴖ  Save this session" },
    ["<leader>Sd"] = { "<cmd> SessionManager! delete_session <CR>", "  Delete session" },
    ["<leader>Sf"] = { "<cmd> SessionManager! load_session <CR>", "ﰍ  Search session" },
  },
}

 M.Copilot = {
--   mode_opts = { expr = true },
   i = {
     ["A-"] = { 'copilot#Accept("<Left>")', "   copilot accept" },
   }
}

return M

