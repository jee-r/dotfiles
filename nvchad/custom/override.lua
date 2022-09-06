-- overriding default plugin configs!

local M = {}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "emmet-ls",
    "json-lsp",
    "tailwindcss-language-server",
    "xo",
    "prettier",

    -- shell
    "bash-language-server",
    -- "shfmt",
    "shellcheck",

    -- other
    "dockerfile-language-server",
  },
}

M.treesitter = {
   ensure_installed = {
      "bash",
      "lua",
      "html",
      "css",
      "dockerfile",
      "javascript",
      "typescript",
      "php",
      "python",
      "yaml",
   },
}

M.nvimtree = {
   git = {
      enable = true,
      ignore = false,
   },

  renderer = {
    highlight_git = true,
    icons = {
      git_placement = "before",
      show = {
        git = true,
      },
    },
  },
  view = {
    side = "left",
    width = 30,
  }
}

-- M.copilot = {
--   copilot_no_tab_map = true
-- }

return M
