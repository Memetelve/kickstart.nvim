vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'moves lines down in visual selection' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'moves lines up in visual selection' })

vim.keymap.set('n', '<leader>bl', Snacks.git.blame_line, { desc = 'show git blame for current line' })
vim.keymap.set('n', '<leader>lg', Snacks.lazygit.open, { desc = 'show lazygit widow' })

local telecope_builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>ld', telecope_builtin.lsp_definitions, { desc = 'Show lsp definitions' })
vim.keymap.set('n', '<leader>lr', telecope_builtin.lsp_references, { desc = 'Show lsp references' })
vim.keymap.set('n', '<leader>lD', telecope_builtin.diagnostics, { desc = 'Show lsp diagnostics' })

vim.keymap.set('n', '<leader>rn', ':IncRename ')

vim.keymap.set('n', 'gt', ':BufferNext<CR>')
vim.keymap.set('n', 'gT', ':BufferPrev<CR>')

vim.keymap.set('n', '<leader>fp', function()
  local filePath = vim.fn.expand '%:~' -- Gets the file path relative to the home directory
  vim.fn.setreg('+', filePath) -- Copy the file path to the clipboard register
  print('File path copied to clipboard: ' .. filePath) -- Optional: print message to confirm
end, { desc = 'Copy file path to clipboard' })

vim.keymap.set('n', '<leader>tt', require('transparent').toggle)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.keymap.set('n', 'gd', function()
      vim.lsp.buf.declaration()
    end, { buffer = 0, desc = 'Goto declaration' })
  end,
})

vim.keymap.set('n', '<leader>c', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle comment line' })

vim.keymap.set('v', '<leader>c', function()
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle comment selection' })
