require('lspconfig').basedpyright.setup {
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

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = true, desc = 'Format Python file' })
  end,
})

local null_ls = require 'null-ls'

null_ls.setup {
  sources = {
    require 'none-ls.formatting.ruff',
    require 'none-ls.diagnostics.ruff',
  },
}
