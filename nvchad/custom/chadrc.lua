local M = {}

-- override default plugins config
local override = require "custom.override"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

-- M.options = {
-- 	expandtab = false,
-- 	shiftwidth = 2,
-- 	smartindent = true,
-- 	tabstop = 4,
-- 	softtabstop = 2,
-- }

M.plugins = {

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["williamboman/mason.nvim"] = override.mason,
  },

  user = require "custom.plugins",

  -- options = {
  --   lspconfig = {
  --     setup_lspconf = "custom.plugins.lspconfig"
  --   },
  -- },
}

M.ui = {
   theme = "gruvchad",
}

M.mappings = require "custom.mappings"


return M
