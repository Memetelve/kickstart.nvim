local function log_macro()
  -- Get the current visual selection
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  local first_col = start_pos[3]
  local last_col = end_pos[3]
  local line = end_pos[2]

  -- Only handle single-line selection
  if #lines == 1 then
    local selected = string.sub(lines[1], first_col, last_col)
    local filetype = vim.bo.filetype
    local statement

    if filetype == 'python' then
      statement = string.format('print(f"%s = {%s}")', selected, selected)
    elseif filetype == 'ruby' then
      statement = string.format('log "%s = #{%s}"', selected, selected)
    else
      print 'Not a Python or Ruby file.'
      return
    end

    vim.api.nvim_buf_set_lines(0, line, line, false, { statement })
  else
    print 'Multi-line selection not supported.'
  end
end

vim.keymap.set('v', '<leader>p', log_macro, { desc = 'Print/puts selected variable', noremap = true })
