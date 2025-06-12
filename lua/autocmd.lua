-- close nvim-tree if it's last buffer open
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    if #vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == 'oil' then
      vim.cmd 'quit'
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',

  callback = function()
    if vim.bo.filetype == 'snacks_dashboard' then
      require('notify').notify(vim.bo.filetype, 'info')
      require('mini.trailspace').unhighlight()
      -- require('notify').notify('bbbb', 'error')
    end
  end,
})

-- auto-create missing dirs when saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local dir = vim.fn.expand '<afile>:p:h'
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})
