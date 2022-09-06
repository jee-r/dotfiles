local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- Completion
  --
  b.completion.luasnip,

  -- webdev stuff
  -- b.formatting.deno_fmt ,
  b.code_actions.xo,

  -- b.code_actions.xo.with {
  -- prefer_local = "node_modules/.bin",
  -- },

  b.diagnostics.xo,
  -- b.diagnostics.xo.with {
  --   prefer_local = "node_modules/.bin",
  -- },

  b.formatting.prettier.with {
    extra_args = { "--use-tabs", "--single-quote" },
  },

  -- b.formatting.prettier.with {
  -- filetypes = { "html", "markdown", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  -- prefer_local = "/node_modules/.bin",
  -- },

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
