-- lua/lang/python.lua

-- LSP: Pyright
-- require('lspconfig').pyright.setup {}

-- Using nvim-lspconfig
require('lspconfig').pyright.setup {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
      },
    },
  },
}

-- Formatter: Black (via null-ls/none-ls)
local null_ls = require 'null-ls'
-- null_ls.register(null_ls.builtins.formatting.black.with {
--   extra_args = { '--fast' },
-- })
--
-- Linter: Flake8 (via null-ls/none-ls)
-- null_ls.register(null_ls.builtins.diagnostics.flake8)

-- Optional: Keymap to format Python files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = true, desc = 'Format Python file' })
  end,
})
