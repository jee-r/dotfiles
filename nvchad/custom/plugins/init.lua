return {
  ["Shatur/neovim-session-manager"] = {
    -- module = "session-manager",
    cmd = "SessionManager",
    after = "ui",
    -- event = "BufWritePost",
    config = function()
      require "custom.plugins.session_manager"
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  ["github/copilot.vim"] = {
    disable = true,
    cmd = {
      "Copilot",
    },
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
}
