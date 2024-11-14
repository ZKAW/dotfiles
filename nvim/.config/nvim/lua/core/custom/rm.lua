-- Create a custom command ':Rm' to delete the current file and close the buffer with confirmation
vim.api.nvim_create_user_command('Rm', function()
  -- Get the relative file path
  local file_path = vim.fn.expand('%')

  -- Prompt the user for confirmation
  local confirm = vim.fn.input('Are you sure you want to delete ' .. file_path .. '? [Y/n]: ')

  -- Normalize the input to lowercase and handle default (empty input)
  confirm = string.lower(confirm)
  if confirm == '' then
    confirm = 'y'
  end

  -- Proceed if the user confirmed
  if confirm == 'y' then
    -- Check if the file exists
    if vim.fn.filereadable(file_path) == 1 then
      -- Delete the file
      os.remove(file_path)
      -- Notify the user
      print('\nFile ' .. file_path .. ' deleted')
    else
      -- Notify the user that the file does not exist
      print('\nFile does not exist')
    end

    -- Close the buffer
    vim.cmd('bd!')
  else
    -- Notify the user that the action was canceled
    print('\nAction canceled')
  end
end, {})
