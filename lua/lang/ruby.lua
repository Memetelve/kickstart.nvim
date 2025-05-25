-- LSP setup for Ruby
require('lspconfig').ruby_lsp.setup {}

local null_ls = require 'null-ls'

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.rubocop.with {
      -- You can add extra args if needed, but by default, warnings are shown
      -- extra_args = { "--display-cop-names" },
    },
  },
}
